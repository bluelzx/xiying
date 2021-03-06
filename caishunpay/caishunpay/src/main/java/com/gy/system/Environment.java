/*
 * Decompiled with CFR 0_124.
 */
package com.gy.system;

import com.gy.util.StringUtil;

import java.util.HashMap;
import java.util.Map;

public enum Environment {
    GUANGDA_URL("https://pay.swiftpass.cn/pay/gateway", "UTF-8", "text/xml"),
    ZHONGXIN_BANK_URL("https://api.citicbankpay.com/pay/gateway", "UTF-8", "text/xml"),
    ZHONGXIN_BANKH5_URL("https://api.tnbpay.com/pay/gateway", "UTF-8", "text/xml"),
    DAYDAYPAY_GETQRCODE_URL("http://api.190ip.com/webservice/api/pay/lfcsb", "UTF-8", "application/json"),
    DAYDAYPAY_QUERY_URL("http://api.190ip.com/webservice/api/query/lfcsb", "UTF-8", "application/json"),
    DAYDAYPAY_NEW_GETQRCODE_URL("http://121.201.38.145:8098/webwt/codepay/quickorder.json", "UTF-8", "application/json"),
    DAYDAYPAY_NEW_QUERY_URL("http://121.201.38.145:8098/webwt/codepay/quickqueryorder.json", "UTF-8", "application/json"),
    DAYDAYPAY_NEW_UNIFIE_ORDER_URL("http://121.201.38.145:8098/webwt/codepay/unifiedorder.json", "UTF-8", "application/json"),
    HUIKA_ORDER_CREATE_URL("http://www.hicardpay.com:8080/hicardpay/order/create", "UTF-8", "application/json"),
    HUIKA_ORDER_QUERY_URL("http://www.hicardpay.com:8080/hicardpay/order/query", "UTF-8", "application/json"),
    TFB_JS_PAY_URL("http://upay.tfb8.com/test/cgi-bin/v2.0/api_wx_subpay_apply.cgi", "GBK", "text/xml"),
    TFB_REQUEST_PAY_URL("http://apitest.tfb8.com/cgi-bin/v2.0/api_wx_pay_apply.cgi", "GBK", "text/xml"),
    TFB_QUERY_PAY_URL("http://upay.tfb8.com/cgi-bin/v2.0/api_wx_pay_single_qry.cgi", "GBK", "text/xml"),
    TFB_REQUEST_ALIPAY_URL("http://upay.tfb8.com/test/cgi-bin/v2.0/api_ali_pay_apply.cgi", "GBK", "text/xml"),
    TFB_QUERY_ALIPAY_URL("http://upay.tfb8.com/test/cgi-bin/v2.0/api_ali_pay_qry.cgi", "GBK", "text/xml"),
    TFB_SINGLE_PAY_URL("http://upay.tfb8.com/test/cgi-bin/v2.0/api_pay_single.cgi", "UTF-8", "text/xml"),
    TFB_EBANK_APPLY_URL("http://apitest.tfb8.com/cgi-bin/v2.0/api_cardpay_apply.cgi", "GBK", "text/xml"),
    TFB_EBANK_QUEYR_URL("http://apitest.tfb8.com/cgi-bin/v2.0/api_single_qry_order.cgi", "GBK", "text/xml"),
    MINSHENG_PAY_URL("http://epay.cmbc.com.cn/appweb/appserver/lcbpPay.do", "UTF-8", "application/json"),
    MINSHENG_QUERY_PAY_URL("http://epay.cmbc.com.cn/appweb/appserver/paymentResultSelect.do", "UTF-8", "application/json"),
    MINSHENG_JSPAY_URL("http://epay.cmbc.com.cn/appweb/cmbcPayweb.do", "UTF-8", "application/json"),
    CUPE_GET_PAY_URL("http://vc.counect.com/vcupe/getPay.do", "UTF-8", "application/x-www-form-urlencoded"),
    CUPE_QUERY_PAY_URL("http://vc.counect.com/vcupe/queryPay.do", "UTF-8", "application/x-www-form-urlencoded"),
    EBUSI_PAY_URL("http://pay.ling-pay.com/PhonePOSPInterfaceNew/CooperativebusinessInterface", "UTF-8", "application/x-www-form-urlencoded"),
    WLJR_PAY_URL("http://121.201.38.219:8062/webservice/order", "UTF-8", "application/x-www-form-urlencoded"),
    QUICKPAY_MOBAO("http://newpay.kspay.net:8080/ks_onlpay/gateways/trans", "GBK", "application/x-www-form-urlencoded"),
    WEZBANK_ALIPAY_URL("https://l.test-svrapi.webank.com/api/acq/server/alipay/precreatetrade", "utf-8", "application/json"),
    WEZBANK_ALI_REGMCHT_URL("https://l.test-svrapi.webank.com/api/acq/server/alipay/regmch", "utf-8", "application/json"),
    WEZBANK_ALIQUERY_URL("https://l.test-svrapi.webank.com/api/acq/server/alipay/querytrade", "utf-8", "application/json"),
    HELIBAO_URL("http://interface.helipay.com/trx/app/interface.action", "utf-8", "application/x-www-form-urlencoded"),
    HELIBAO_QUICKPAY_URL("http://pay.trx.helipay.com/trx/quickPayApi/interface.action", "utf-8", "application/x-www-form-urlencoded"),
    HELIBAO_DAIFU_URL("http://transfer.trx.helipay.com/trx/transfer/interface.action", "utf-8", "application/x-www-form-urlencoded"),
    YINSHENGBAO_PAY_URL("114.80.54.73:8081", "utf-8", "application/x-www-form-urlencoded"),
    HFBANK_PAY_URL("http://139.196.250.81/newWechats/newWeChatpayment_mobile.action", "utf-8", "application/x-www-form-urlencoded"),
    QIYE_PAY_URL("http://121.41.121.164:8044/TransInterface/TransRequest", "utf-8", "application/x-www-form-urlencoded"),
    GUOYIN_QRCODEPAY_URL("http://113.106.95.37:7777/gyprovider/getNativeUrl.do", "utf-8", "application/x-www-form-urlencoded"),
    GUOYIN_QRCODEQUERY_URL("http://113.106.95.37:7777/gyprovider/queryNativePay.do", "utf-8", "application/x-www-form-urlencoded"),
    GUOYIN_JSPAY_URL("http://113.106.95.37:7777/gyprovider/getJspay.do", "utf-8", "application/x-www-form-urlencoded"),
    GUOYIN_NETPAY_URL("http://113.106.95.37:7777/gyprovider/netpay/applyPay.do", "utf-8", "application/x-www-form-urlencoded"),
    GUOYIN_NETPAY_QUERYURL("http://113.106.95.37:7777/gyprovider/netpay/queryPay.do", "utf-8", "application/x-www-form-urlencoded"),
    GUOYIN_DAIFU_URL("http://113.106.95.37:7777/gyprovider/daifu/singlePay.do", "utf-8", "application/x-www-form-urlencoded"),
    GUOYIN_DAIFU_QUERYURL("http://113.106.95.37:7777/gyprovider/daifu/querySinglePay.do", "utf-8", "application/x-www-form-urlencoded"),
    HENGFENG_PAY_URL("http://extman.kefupay.cn/newWechats/newWeChatpayment_mobile.action", "utf-8", "application/x-www-form-urlencoded"),
    YAKU_PAY_URL("http://gate.rpymt.com/qcmas/gateway.do", "utf-8", "application/x-www-form-urlencoded"),
    NINEPI_PAY_URL("https://jd.kingpass.cn/paygateway/mpsGate/mpsTransaction", "GB18030", "application/x-www-form-urlencoded"),
    ZHANGCAITONG_QUICKPAY_URL("http://pay.mishua.cn/zhonlinepay/service/down/trans/payDzero", "UTF-8", "application/json"),
    PUFA_BANK_URL("https://pfpay.haocaiqi.net/api/", "UTF-8", "application/x-www-form-urlencoded"),
    HAIBEI_PAY_URL("https://pay.166985.com/wappay/payapi/order", "UTF-8", "application/x-www-form-urlencoded"),
    HAIBEI_QUERY_URL("https://pay.166985.com/wappay/payapi/query", "UTF-8", "application/x-www-form-urlencoded"),
    HENGFUTONG_PAY_URL("https://mypay.hengfupay.com/interface/OrderApply.aspx", "UTF-8", "application/x-www-form-urlencoded"),
    HENGFUTONG_QUERY_URL("https://mypay.hengfupay.com/interface/OrderQuery.aspx", "UTF-8", "application/x-www-form-urlencoded"),
    WANZHONGYUNFU_PAY_URL("http://n.epay.api.taidupay.com/api/pay/unifiedOrder", "UTF-8", "application/json"),
    WANZHONGYUNFU_QUERY_URL("http://n.epay.api.taidupay.com/api/pay/orderQuery", "UTF-8", "application/json"),
    ZHIWUKEJI_PAY_URL("http://120.77.22.14:8380/pay/gateway/unify.do", "UTF-8", "application/x-www-form-urlencoded"),
    ZHIWUKEJI_QUERY_URL("http://120.77.22.14:8380/pay/gateway/query.do", "UTF-8", "application/x-www-form-urlencoded"),

    YINSHENGBAO_QUICK_FRONTEND_URL("http://114.80.54.74:8082/quickpay-front/quickPayWap/prePay", "UTF-8", "application/json"),
    YINSHENGBAO_QUICK_QUERY_URL("http://114.80.54.74:8082/quickpay-front/quickPayWap/queryOrderStatus", "UTF-8", "application/json"),
    SHIFUTONG_FRONTEND_URL("http://qr.sytpay.cn/api/v1/create.php", "UTF-8", "application/json"),
    ZHIHUIFU_FRONTEND_URL("http://gpay.chinagpay.com/bas/FrontTrans", "UTF-8", "application/json"),
    ZHIHUIFU_QUERY_URL("http://gpay.chinagpay.com/bas/BgTrans", "UTF-8", "application/json"),

    DEFAULT_JUMP_URL("http://gateway.ykbpay.com:8080/caishunpay-web/payredirect/jump", "UTF-8", "application/json"),

    CS_PAY_URL("http://43.249.29.218 /cspay/api/v1/transRequest", "UTF-8", "application/json"),
    CS_DFTRADE_URL("http://43.249.29.218 /cspay/api/v1/dftradeQuery","UTF-8", "application/json"),
    CS_BALANCE_URL("http://43.249.29.218 /cspay/api/v1/balanceRequest","UTF-8", "application/json"),
    CUSTOM(null, null, null);

    private String baseUrl;
    private String charset;
    private String contentType;
    private Map<String, String> headerParam;

    private Environment(String baseUrl, String charset, String contentType) {
        this.baseUrl = baseUrl;
        this.charset = (String) charset;
        this.contentType = contentType;
    }

    public String getBaseUrl() {
        return this.baseUrl;
    }

    public String getCharset() {
        return this.charset;
    }

    public String getContentType() {
        return this.contentType;
    }

    public Map<String, String> getHeaderParam() {
        return this.headerParam;
    }

    public void setBaseUrl(String baseUrl) {
        this.baseUrl = baseUrl;
    }

    public static Environment createEnvironment(String baseUrl, String charset, String contentType) {
        Environment environment = CUSTOM;
        environment.baseUrl = baseUrl;
        environment.charset = charset;
        environment.contentType = contentType;
        return environment;
    }

    public void addHeader(String name, String value) {
        if (this.headerParam == null) {
            this.headerParam = new HashMap<String, String>();
        }
        this.headerParam.put(name, value);
    }

    public static boolean getBooleanProperty(String propertyName) {
        boolean value = false;
        String stringValue = Environment.getProperty(propertyName);
        if (stringValue != null) {
            value = Boolean.parseBoolean(stringValue.trim());
        }
        return value;
    }

    public static int getIntProperty(String propertyName) {
        int value = 0;
        String stringValue = Environment.getProperty(propertyName);
        value = StringUtil.parseInt(stringValue);
        return value;
    }

    public static String getProperty(String propertyName) {
        String stringValue = null;
        String propValue = System.getProperty(propertyName);
        String envValue = System.getenv(propertyName);
        if (propValue != null && propValue.trim().length() > 0) {
            stringValue = propValue;
        } else if (envValue != null && envValue.trim().length() > 0) {
            stringValue = envValue;
        }
        return stringValue;
    }
}
