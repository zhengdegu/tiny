package com.gu.tiny.modules.ums.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.gu.tiny.modules.ums.model.UmsLog;
import com.baomidou.mybatisplus.extension.service.IService;
import com.gu.tiny.modules.ums.model.UmsMenu;
import org.aspectj.lang.ProceedingJoinPoint;

/**
 * <p>
 * 系统日志 服务类
 * </p>
 *
 * @author FastG
 * @since 2020-10-22
 */
public interface UmsLogService extends IService<UmsLog> {
    /**
     * 保存操作日志
     * @param username 用户名
     * @param browser 浏览器
     * @param ip  ip地址
     * @param joinPoint   参数
     * @param log 数据
     */
    void save(String username, String browser, String ip, ProceedingJoinPoint joinPoint, UmsLog log);


}
