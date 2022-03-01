package com.incampusit.ottstreaming;

import android.app.Application;
import android.content.Context;
import android.os.AsyncTask;

public abstract class BaseApplication extends Application {


    private int success;

    private static BaseApplication a;

    public BaseApplication() {
        a = this;
    }

    public static Context getContext() {
        return a;
    }


    public void onCreate() {
        super.onCreate();
        new OneLoadAllProducts().execute();

    }


    private class OneLoadAllProducts extends AsyncTask<String, String, String> {

        /**
         * Before starting background thread Show Progress Dialog
         * */
        @Override
        protected void onPreExecute() {
            super.onPreExecute();
        }

        /**
         * getting All products from url
         * */
        protected String doInBackground(String... args) {

            

            try {
               
                success = 1;

            } catch (Exception e) {
                e.printStackTrace();
            }

            return null;
        }

        /**
         * After completing background task Dismiss the progress dialog
         * **/
        protected void onPostExecute(String file_url) {

//            // updating UI from Background Thread
//            runOnUiThread(new Runnable() {
//                public void run() {
                    /*
                      Updating parsed JSON data into ListView
                     */
                    if (success == 1) {
                        // jsonarray found
                        // Getting Array of jsonarray

                    } else if (success == 2){
                                
                    }

//                }
//            });

        }

    }
}
