package com.incampusit.config;

import com.incampusit.ottstreaming.BuildConfig;

public class config {

    public static final String main = "https://incampus.co.in/ottapi/";

    public static final String mainurl = "https://incampus.co.in/ottapi/";

    public static final String privacypolicy = mainurl+"/terms_policy.php";

    public static final String paytmchecksum = mainurl + "paytm/";

    public static final String appurl = mainurl+"/admin/uploads/app.apk";

    // Envato codecanyon purchase code
    public static final String PURCHASE_CODE = BuildConfig.PURCHASE_CODE;

    public static final String currency = "INR";

    //Demo app
    //if yes type "true", for no type "false"
    public static final boolean demo = false;

    //Payment Gateway
    //Type true to visible
    //Type false to invisible
    public static final boolean paytm = true;
    public static final boolean paypal = true;
    public static final boolean instamojo = true;
    public static final boolean razorpay = true;
    public static final boolean google = true;
    public static final boolean paykun = false;
    public static final boolean traknpay = false;

    // Paytm
    // Test API Details
//    public static String MID = "EJHiMn10015192456115";
//    public static String WEBSITE = "WEBSTAGING";
//    public static String INDUSTRY_TYPE_ID = "Retail";
//    public static String CALLBACK_URL = "https://securegw-stage.paytm.in/theia/paytmCallback?ORDER_ID=";

    // Production
    public static final String MID = "cHQrqq17392877779909";
    public static final String WEBSITE = "DEFAULT";
    public static final String INDUSTRY_TYPE_ID = "Retail";
    public static final String CALLBACK_URL = "https://securegw.paytm.in/theia/paytmCallback?ORDER_ID=";

    // Razorpay
    public static String ApiKey = "rzp_live_IEZg8qb41ELHfZ";
    public static String Razorpay_currency = "INR";

    // Googlepay
    public static String UPI = "rajan@ok";
    public static String MERCHANTNAME = "Rajan";

//    // Paykun
//    public static String merchantIdLive="114479973849978"; // merchant id for live mode application id  = com.paykunsandbox.live
//    public static String accessTokenLive="8F070CD9FF24BEC8FC77F1FD9CAA1A40"; // access token for live mode application id  = com.paykunsandbox.live
//
//    // Traknpay
//    public static String PG_API_KEY = "xxxxx-xxxxx-xxxxx-xxxxx-xxxxx";

}
