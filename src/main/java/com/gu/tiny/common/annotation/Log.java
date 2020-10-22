package com.gu.tiny.common.annotation;

import com.gu.tiny.common.annotation.type.LogActionType;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * @author FastG
 * @date 2020/10/22 10:22
 */
@Target(ElementType.METHOD)
@Retention(RetentionPolicy.RUNTIME)
public @interface Log {
    String value() default "";

    /**
     * 是否启用
     *
     * @return
     */
    boolean enable() default true;

    LogActionType type() default LogActionType.SELECT;
}
