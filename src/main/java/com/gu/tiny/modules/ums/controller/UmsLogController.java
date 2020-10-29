package com.gu.tiny.modules.ums.controller;


import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.gu.tiny.common.annotation.Log;
import com.gu.tiny.common.api.CommonPage;
import com.gu.tiny.common.api.CommonResult;
import com.gu.tiny.modules.ums.model.UmsLog;
import com.gu.tiny.modules.ums.service.UmsLogService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

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

    @Log("根据用户名分页获取用户操作日志列表")
    @ApiOperation("根据用户名分页获取用户操作日志列表")
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    @ResponseBody
    public CommonResult<CommonPage<UmsLog>> list(@RequestParam(value = "keyword", required = false) String keyword,
                                                 @RequestParam(value = "pageSize", defaultValue = "5") Integer pageSize,
                                                 @RequestParam(value = "pageNum", defaultValue = "1") Integer pageNum) {
        Page<UmsLog> logList = umsLogService.list(keyword, pageSize, pageNum);
        return CommonResult.success(CommonPage.restPage(logList));
    }

    @Log("删除指定操作日志信息")
    @ApiOperation("删除指定操作日志信息")
    @RequestMapping(value = "/delete/{id}", method = RequestMethod.POST)
    @ResponseBody
    public CommonResult delete(@PathVariable Long id) {
        boolean success = umsLogService.removeById(id);
        if (success) {
            return CommonResult.success(null);
        }
        return CommonResult.failed();
    }
}

