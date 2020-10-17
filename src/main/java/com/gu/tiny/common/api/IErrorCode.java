package com.gu.tiny.common.api;

/**
 * 封装API的错误码
 * @author g130016
 */
public interface IErrorCode {

    /**
     * 响应码
     * @return long
     */
    long getCode();

    /**
     * 响应消息
     * @return String
     */
    String getMessage();
}
