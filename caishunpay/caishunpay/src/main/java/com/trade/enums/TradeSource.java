/*
 * Decompiled with CFR 0_124.
 */
package com.trade.enums;

public enum TradeSource {
    ALIPAY("1", "\u652f\u4ed8\u5b9d"),//支付宝
    ALI_WAP_PAY("12", "\u652f\u4ed8\u5b9dH5"),//支付宝H5
    WEPAY("2", "\u5fae\u4fe1\u652f\u4ed8"),//微信支付
    WEJSPAY("21", "\u5fae\u4fe1\u516c\u4f17\u53f7\u652f\u4ed8"),//微信公众号支付
    WE_WAP_PAY("22", "\u5fae\u4fe1H5\u652f\u4ed8"),//微信H5支付
    BAIDUPAY("3", "\u767e\u5ea6\u652f\u4ed8"),//百度支付
    QQPAY("4", "\u624b\u673aQQ\u652f\u4ed8"),//手机QQ支付
    QQ_WAP_PAY("42", "QQWAP"),//
    JDPAY("5", "\u4eac\u4e1c"),//京东
    NETPAY("6", "网银支付"),//
    QUICKPAY("7", "\u5feb\u6377\u652f\u4ed8"),//快捷支付
    BANLANCE_DAIFU("8", "\u4f59\u989d\u4ee3\u4ed8"),//余额代付
    UNIPAY_QRCODE("71", "银联扫码"),
    DAIKOU("K", "\u4ee3\u6263"),//代扣
    DIANZI_DAIFU("9", "\u57ab\u8d44\u4ee3\u4ed8"),//垫资代付
    XFZF_DF_DZ("DZ","垫资代付"),
    XFZF_DF_NO("NO","余额代付");



    
    private String code;
    private String memo;

    private TradeSource(String code, String memo) {
        this.code = code;
        this.memo = (String)memo;
    }

    public static TradeSource get(String code) {
        TradeSource[] enums;
        TradeSource[] arrtradeSource = enums = TradeSource.values();
        int n = arrtradeSource.length;
        int n2 = 0;
        while (n2 < n) {
            TradeSource perEnum = arrtradeSource[n2];
            if (perEnum.getCode().equals(code)) {
                return perEnum;
            }
            ++n2;
        }
        return null;
    }

    public String getCode() {
        return this.code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getMemo() {
        return this.memo;
    }

    public void setMemo(String memo) {
        this.memo = memo;
    }
}
