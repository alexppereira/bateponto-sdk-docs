import com.pontotel.bateponto.sdk.BatePontoSdk

// Dentro da sua Activity; abrirBatePontoButton é o botão da sua tela.
abrirBatePontoButton.setOnClickListener {
    BatePontoSdk.open(this)
}
