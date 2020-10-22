package com.gu.tiny.modules.ums.controller;


import com.gu.tiny.modules.ums.service.UmsLogService;
import io.swagger.annotations.Api;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * <p>
 * 系统日志 前端控制器
 * </p>
 *
 * @author FastG
 * @since 2020-10-22
 */
@Controller
@Api(tags = "UmsLogController", description = "后台日志管理")
@RequestMapping("/log")
public class UmsLogController {

    @Autowired
    private UmsLogService umsLogService;
}

