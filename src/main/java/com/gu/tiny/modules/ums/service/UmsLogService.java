package com.gu.tiny.modules.ums.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import com.gu.tiny.modules.ums.model.UmsLog;
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
     * @param  url url
     * @param browser 浏览器
     * @param ip  ip地址
     * @param joinPoint   参数
     * @param log 数据
     */
    void save(String username, String url, String browser, String ip, ProceedingJoinPoint joinPoint, UmsLog log);

    /**
     * 根据用户名或昵称分页查询用户操作日志
     *
     * @param keyword
     * @param pageSize
     * @param pageNum
     * @return
     */
    Page<UmsLog> list(String keyword, Integer pageSize, Integer pageNum);

}
