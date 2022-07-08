package com.example.listas_9a;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.RelativeLayout;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.recyclerview.widget.RecyclerView;

import java.util.ArrayList;

public class ItemsAdapter extends RecyclerView.Adapter<ItemsAdapter.RecyclerViewHolder> {
    private ArrayList<String> elementos = new ArrayList<>();
    private AdapterCallback callback;
    private Context context;

    public ItemsAdapter(Context context, ArrayList<String> elementos, AdapterCallback callback) {
        this.elementos = elementos;
        this.callback = callback;
        this.context = context;
    }

    public interface AdapterCallback{
        void onItemClicked(Integer itemPosition);
    }

    @NonNull
    @Override
    public RecyclerViewHolder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
        View view = LayoutInflater.from(parent.getContext()).inflate(R.layout.item_list, parent, false);
        return new RecyclerViewHolder(view);
    }

    public static class RecyclerViewHolder
            extends RecyclerView.ViewHolder{

        RelativeLayout relativeLayout;
        TextView text;

        public RecyclerViewHolder(@NonNull View itemView) {
            super(itemView);
            relativeLayout = itemView.findViewById(R.id.container);
            text = itemView.findViewById(R.id.description);
        }
    }

    @Override
    public void onBindViewHolder(@NonNull RecyclerViewHolder holder, int position) {
        String element = elementos.get(position);
        holder.relativeLayout.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                if (callback != null){
                    callback.onItemClicked(position);
                }
            }
        });

        holder.text.setText(element);

    }

    @Override
    public int getItemCount() {
        return elementos.size();
    }
}
