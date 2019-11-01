package com.example.coroutinesapp.network

import io.ktor.client.HttpClient
import io.ktor.client.request.parameter
import io.ktor.client.request.request
import io.ktor.client.response.HttpResponse
import io.ktor.client.response.readText
import io.ktor.client.utils.EmptyContent
import io.ktor.http.HttpMethod
import io.ktor.http.URLProtocol

class GetCivsRequest {
    private val serverAddress:String = "age-of-empires-2-api.herokuapp.com"
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
                    host = serverAddress
                    encodedPath = "api/v1/civilizations"
                }
                method = HttpMethod.Get
                body = EmptyContent
            }
            call.readText()
        } catch (requestException:Exception) {
            requestException.message ?: "Default error message"
        }
    }
}