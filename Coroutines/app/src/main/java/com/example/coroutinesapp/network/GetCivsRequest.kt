package com.example.coroutinesapp.network

import io.ktor.client.HttpClient
import io.ktor.client.request.request
import io.ktor.client.response.HttpResponse
import io.ktor.client.response.readText
import io.ktor.client.utils.EmptyContent
import io.ktor.http.HttpMethod
import io.ktor.http.URLProtocol
import io.ktor.http.fullPath

class GetCivsRequest {
    companion object {
        private const val SERVER_ADDRESS:String = "age-of-empires-2-api.herokuapp.com"
        private const val CIVILIZATIONS_ENCODED_PATH:String = "api/v1/civilizations"
        private const val CIVILIZATION_ENCODED_PATH:String = "api/v1/civilization"
    }

    private val serverProtocol:URLProtocol = URLProtocol.HTTPS
    private val client = HttpClient {
        expectSuccess = false
    }

    suspend fun getAllCivs():String {
        return try
        {
            val call = client.request<HttpResponse> {
                url {
                    protocol = serverProtocol
                    host = SERVER_ADDRESS
                    encodedPath = CIVILIZATIONS_ENCODED_PATH
                }
                method = HttpMethod.Get
                body = EmptyContent
            }
            call.readText()
        } catch (requestException:Exception) {
            requestException.message ?: "Default error message"
        }
    }

    suspend fun getCurrentCiv(id:Int):String {
        return try
        {
            val call = client.request<HttpResponse> {
                url {
                    protocol = serverProtocol
                    host = SERVER_ADDRESS
                    encodedPath = "$CIVILIZATION_ENCODED_PATH/$id"
                }
                println(url.build().fullPath)
                method = HttpMethod.Get
                body = EmptyContent
            }
            call.readText()
        } catch (requestException:Exception) {
            requestException.message ?: "Default error message"
        }
    }
}