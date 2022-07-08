package com.example.listas_9a;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.speech.RecognizerIntent;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;
import android.widget.Toast;

import androidx.wear.widget.WearableLinearLayoutManager;
import androidx.wear.widget.WearableRecyclerView;

import java.util.ArrayList;
import java.util.List;

public class MainActivity extends Activity {
    private Button btnIniciar;
    private TextView txtMensaje;
    private String prueba;
    private int contador = 0;
    ArrayList<String> datos = new ArrayList<>();
    ItemsAdapter itemsAdapter;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        btnIniciar = findViewById(R.id.btnIniciar);
        txtMensaje = findViewById(R.id.txtMensaje);


        datos.add("Gilberto Rodríguez");
        datos.add(txtMensaje.getText().toString());

        //agregar(datos);
        WearableRecyclerView recyclerView =
                findViewById(R.id.recycler_launcher_view);

        recyclerView.setHasFixedSize(true);
        recyclerView.setEdgeItemsCenteringEnabled(true);
        recyclerView.setLayoutManager(new WearableLinearLayoutManager(this));

        itemsAdapter = new ItemsAdapter(getApplicationContext(), datos, new ItemsAdapter.AdapterCallback() {
            @Override
            public void onItemClicked(Integer itemPosition) {

            }
        });

        recyclerView.setAdapter(itemsAdapter);


        recyclerView.setAdapter(new ItemsAdapter(this, datos, new ItemsAdapter.AdapterCallback() {
           @Override
            public void onItemClicked(Integer itemPosition) {
               Toast.makeText(MainActivity.this, "" + datos.get(itemPosition), Toast.LENGTH_SHORT).show();
           }
        }));

        btnIniciar.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                iniciarGrabacion();
            }
        });

    }

    private void iniciarGrabacion(){

        Intent intent = new Intent(RecognizerIntent.ACTION_RECOGNIZE_SPEECH);
        intent.putExtra(RecognizerIntent.EXTRA_LANGUAGE_MODEL, RecognizerIntent.LANGUAGE_MODEL_FREE_FORM);
        startActivityForResult(intent, 0);
    }

    @Override
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        super.onActivityResult(requestCode, resultCode, data);
        // requestCode = 0, resultCode = -1
        //Toast.makeText(this, "resultCode : " + resultCode, Toast.LENGTH_SHORT).show();
        if(requestCode == 0 && resultCode == RESULT_OK){
            List<String> mensaje  =
                    data.getStringArrayListExtra(RecognizerIntent.EXTRA_RESULTS);

            //Toast.makeText(this, "DATA:" + mensaje.get(0), Toast.LENGTH_SHORT).show();
            //String txtMensaje = mensaje.get(0);
            txtMensaje.setText(mensaje.get(0));
            contador = contador+1;
            //txtMensaje.setText(texto);
            // Agregar el texto al ArrayList

        }

    }
    private ArrayList<String> agregar(ArrayList datos) {
        datos.add(txtMensaje.getText().toString());
        return datos;
    }

}