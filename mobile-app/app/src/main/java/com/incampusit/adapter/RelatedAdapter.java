package com.incampusit.adapter;

import android.content.ContentValues;
import android.content.Context;
import android.content.Intent;
import android.view.LayoutInflater;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.PopupMenu;
import android.widget.TextView;
import android.widget.Toast;

import androidx.recyclerview.widget.RecyclerView;

import com.bumptech.glide.Glide;
import com.bumptech.glide.load.engine.DiskCacheStrategy;
import com.incampusit.favorite.DatabaseHelper;
import com.incampusit.item.ItemLatest;
import com.incampusit.util.Constant;
import com.incampusit.util.JsonUtils;
import com.google.android.gms.ads.InterstitialAd;
import com.incampusit.ottstreaming.ActivityVideoDetails;
import com.incampusit.ottstreaming.R;

import java.util.ArrayList;


public class RelatedAdapter extends RecyclerView.Adapter<RelatedAdapter.ItemRowHolder> {

    private ArrayList<ItemLatest> dataList;
    private Context mContext;
    private InterstitialAd mInterstitial;
    private int AD_COUNT = 0;
    private DatabaseHelper databaseHelper;

    public RelatedAdapter(Context context, ArrayList<ItemLatest> dataList) {
        this.dataList = dataList;
        this.mContext = context;
        databaseHelper = new DatabaseHelper(mContext);
    }

    @Override
    public ItemRowHolder onCreateViewHolder(ViewGroup parent, int viewType) {
        View v = LayoutInflater.from(parent.getContext()).inflate(R.layout.row_home_latest_item, parent, false);
        return new ItemRowHolder(v);
    }

    @Override
    public void onBindViewHolder(final ItemRowHolder holder, final int position) {
        final ItemLatest singleItem = dataList.get(position);

        holder.text.setText(singleItem.getLatestVideoName());
        holder.txt_cat_name.setText(singleItem.getLatestCategoryName());
        holder.txt_time.setText(singleItem.getLatestDuration());
        holder.text_view.setText(JsonUtils.Format(Integer.parseInt(singleItem.getLatestVideoView())));

        if (singleItem.getLatestPremium().equalsIgnoreCase("Y")) {
            holder.premium.setVisibility(View.VISIBLE);
        }

        switch (singleItem.getLatestVideoType()) {
            case "local":
                Glide.with(mContext).load(singleItem.getLatestVideoImgBig()).placeholder(R.drawable.loading).centerCrop().crossFade().diskCacheStrategy(DiskCacheStrategy.RESULT).into(holder.image);
                break;
            case "server_url":
                Glide.with(mContext).load(singleItem.getLatestVideoImgBig()).placeholder(R.drawable.loading).centerCrop().crossFade().diskCacheStrategy(DiskCacheStrategy.RESULT).into(holder.image);
                break;
            case "youtube":
                Glide.with(mContext).load(Constant.YOUTUBE_IMAGE_FRONT + singleItem.getLatestVideoPlayId() + Constant.YOUTUBE_SMALL_IMAGE_BACK).placeholder(R.drawable.loading).centerCrop().crossFade().diskCacheStrategy(DiskCacheStrategy.RESULT).into(holder.image);
                break;
            case "dailymotion":
                Glide.with(mContext).load(Constant.DAILYMOTION_IMAGE_PATH + singleItem.getLatestVideoPlayId()).placeholder(R.drawable.loading).centerCrop().crossFade().diskCacheStrategy(DiskCacheStrategy.RESULT).into(holder.image);
                break;
            case "vimeo":
                Glide.with(mContext).load(singleItem.getLatestVideoImgBig()).placeholder(R.drawable.loading).centerCrop().crossFade().diskCacheStrategy(DiskCacheStrategy.RESULT).into(holder.image);
                break;
            case "embed":
                Glide.with(mContext).load(singleItem.getLatestVideoImgBig()).placeholder(R.drawable.loading).centerCrop().crossFade().diskCacheStrategy(DiskCacheStrategy.RESULT).into(holder.image);
                break;
        }

        holder.lyt_parent.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {

                Constant.LATEST_IDD = singleItem.getLatestId();
                Intent intent_single = new Intent(mContext, ActivityVideoDetails.class);
                intent_single.setFlags(Intent.FLAG_ACTIVITY_CLEAR_TOP);
                mContext.startActivity(intent_single);

//                if (Constant.SAVE_ADS_FULL_ON_OFF.equals("true")) {
//                    AD_COUNT++;
//                    if (AD_COUNT == Integer.parseInt(Constant.SAVE_ADS_CLICK)) {
//                        AD_COUNT = 0;
//                        mInterstitial = new InterstitialAd(mContext);
//                        mInterstitial.setAdUnitId(Constant.SAVE_ADS_FULL_ID);
//                        AdRequest adRequest;
//                        if (JsonUtils.personalization_ad) {
//                            adRequest = new AdRequest.Builder()
//                                    .build();
//                        } else {
//                            Bundle extras = new Bundle();
//                            extras.putString("npa", "1");
//                            adRequest = new AdRequest.Builder()
//                                    .addNetworkExtrasBundle(AdMobAdapter.class, extras)
//                                    .build();
//                        }
//                        mInterstitial.loadAd(adRequest);
//                        mInterstitial.setAdListener(new AdListener() {
//                            @Override
//                            public void onAdLoaded() {
//                                // TODO Auto-generated method stub
//                                super.onAdLoaded();
//                                if (mInterstitial.isLoaded()) {
//                                    mInterstitial.show();
//                                }
//                            }
//
//                            public void onAdClosed() {
//                                Intent intent_single = new Intent(mContext, ActivityVideoDetails.class);
//                                mContext.startActivity(intent_single);
//
//                            }
//
//                            @Override
//                            public void onAdFailedToLoad(int errorCode) {
//                                Intent intent_single = new Intent(mContext, ActivityVideoDetails.class);
//                                mContext.startActivity(intent_single);
//                            }
//                        });
//                    } else {
//                        Intent intent_single = new Intent(mContext, ActivityVideoDetails.class);
//                        mContext.startActivity(intent_single);
//                    }
//                } else {
//                    Intent intent_single = new Intent(mContext, ActivityVideoDetails.class);
//                    mContext.startActivity(intent_single);
//                }

            }
        });

        holder.image_pop_up.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                PopupMenu popup = new PopupMenu(mContext, holder.image_pop_up);
                popup.inflate(R.menu.popup_menu);
                Menu popupMenu = popup.getMenu();
                if (databaseHelper.getFavouriteById(singleItem.getLatestId())) {
                    popupMenu.findItem(R.id.option_add_favourite).setVisible(false);
                } else {
                    popupMenu.findItem(R.id.option_remove_favourite).setVisible(false);
                }
                popup.setOnMenuItemClickListener(new PopupMenu.OnMenuItemClickListener() {
                    @Override
                    public boolean onMenuItemClick(MenuItem item) {
                        switch (item.getItemId()) {
                            case R.id.option_add_favourite:
                                ContentValues fav_list = new ContentValues();
                                fav_list.put(DatabaseHelper.KEY_ID, singleItem.getLatestId());
                                fav_list.put(DatabaseHelper.KEY_TITLE, singleItem.getLatestVideoName());
                                fav_list.put(DatabaseHelper.KEY_IMAGE, singleItem.getLatestVideoImgBig());
                                fav_list.put(DatabaseHelper.KEY_VIEW, singleItem.getLatestVideoView());
                                fav_list.put(DatabaseHelper.KEY_TYPE, singleItem.getLatestVideoType());
                                fav_list.put(DatabaseHelper.KEY_PID, singleItem.getLatestVideoPlayId());
                                fav_list.put(DatabaseHelper.KEY_TIME, singleItem.getLatestDuration());
                                fav_list.put(DatabaseHelper.KEY_CNAME, singleItem.getLatestCategoryName());
                                databaseHelper.addFavourite(DatabaseHelper.TABLE_FAVOURITE_NAME, fav_list, null);
                                Toast.makeText(mContext, mContext.getString(R.string.favourite_add), Toast.LENGTH_SHORT).show();
                                break;
                            case R.id.option_remove_favourite:
                                databaseHelper.removeFavouriteById(singleItem.getLatestId());
                                Toast.makeText(mContext, mContext.getString(R.string.favourite_remove), Toast.LENGTH_SHORT).show();
                                break;

                        }
                        return false;
                    }
                });
                popup.show();
            }
        });
    }

    @Override
    public int getItemCount() {
        return (null != dataList ? dataList.size() : 0);
    }

    public class ItemRowHolder extends RecyclerView.ViewHolder {
        public ImageView image, image_pop_up;
        private TextView text, txt_cat_name, txt_time, text_view;
        private LinearLayout lyt_parent, premium;

        private ItemRowHolder(View itemView) {
            super(itemView);
            image = itemView.findViewById(R.id.image);
            text = itemView.findViewById(R.id.text);
            lyt_parent = itemView.findViewById(R.id.rootLayout);
            premium = itemView.findViewById(R.id.premium);
            txt_cat_name = itemView.findViewById(R.id.text_category);
            txt_time = itemView.findViewById(R.id.text_time);
            text_view = itemView.findViewById(R.id.text_view);
            image_pop_up = itemView.findViewById(R.id.image_pop_up);
        }
    }
}