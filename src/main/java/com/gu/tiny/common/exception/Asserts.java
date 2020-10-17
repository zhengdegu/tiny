package com.gu.tiny.common.exception;


import com.gu.tiny.common.api.IErrorCode;

/**
 * 断言处理类，用于抛出各种API异常
 * @author g130016
 */
public class Asserts {
    public static void fail(String message) {
        throw new ApiException(message);
    }

    public static void fail(IErrorCode errorCode) {
        throw new ApiException(errorCode);
    }
}
