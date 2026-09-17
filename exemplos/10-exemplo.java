import com.pontotel.bateponto.sdk.BatePontoSdk;

// Dentro da MainActivity do seu aplicativo.
abrirBatePontoButton.setOnClickListener(view ->
    BatePontoSdk.open(MainActivity.this)
);
