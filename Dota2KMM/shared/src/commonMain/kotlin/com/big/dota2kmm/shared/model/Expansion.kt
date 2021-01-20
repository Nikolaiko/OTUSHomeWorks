package com.big.dota2kmm.shared.model

import kotlinx.serialization.KSerializer
import kotlinx.serialization.PrimitiveDescriptor
import kotlinx.serialization.Serializable
import kotlinx.serialization.descriptors.PrimitiveKind
import kotlinx.serialization.descriptors.PrimitiveSerialDescriptor
import kotlinx.serialization.descriptors.SerialDescriptor
import kotlinx.serialization.encoding.Decoder
import kotlinx.serialization.encoding.Encoder

@Serializable(with = Expansion.Companion::class)
enum class Expansion(val value: String) {
    AfricanKingdoms("African Kingdoms"),
    AgeOfKings("Age of Kings"),
    ForgottenEmpires("Forgotten Empires"),
    RiseOfRajas("Rise of Rajas"),
    TheConquerors("The Conquerors");

    companion object : KSerializer<Expansion> {
        override val descriptor: SerialDescriptor
            get() {
            return PrimitiveSerialDescriptor("quicktype.Expansion", PrimitiveKind.STRING)
        }
        override fun deserialize(decoder: Decoder): Expansion = when (val value = decoder.decodeString()) {
            "African Kingdoms"  -> AfricanKingdoms
            "Age of Kings"      -> AgeOfKings
            "Forgotten Empires" -> ForgottenEmpires
            "Rise of Rajas"     -> RiseOfRajas
            "The Conquerors"    -> TheConquerors
            else                -> throw IllegalArgumentException("Expansion could not parse: $value")
        }
        override fun serialize(encoder: Encoder, value: Expansion) {
            return encoder.encodeString(value.value)
        }
    }
}