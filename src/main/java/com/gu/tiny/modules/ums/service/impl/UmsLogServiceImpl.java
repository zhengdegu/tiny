package com.gu.tiny.modules.ums.service.impl;

import cn.hutool.core.util.ObjectUtil;
import cn.hutool.core.util.StrUtil;
import cn.hutool.json.JSONObject;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.gu.tiny.common.annotation.Log;
import com.gu.tiny.common.utils.StringUtils;
import com.gu.tiny.modules.ums.model.UmsAdmin;
import com.gu.tiny.modules.ums.model.UmsLog;
import com.gu.tiny.modules.ums.mapper.UmsLogMapper;
import com.gu.tiny.modules.ums.model.UmsMenu;
import com.gu.tiny.modules.ums.service.UmsLogService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.extern.slf4j.Slf4j;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.reflect.MethodSignature;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

/**
 * <p>
 * 系统日志 服务实现类
 * </p>
 *
 * @author FastG
 * @since 2020-10-22
 */
@Slf4j
@Service
public class UmsLogServiceImpl extends ServiceImpl<UmsLogMapper, UmsLog> implements UmsLogService {

    @Resource
    private  UmsLogMapper umsLogMapper;
    @Override
    @Transactional(rollbackFor = Exception.class)
    public void save(String username,String url, String browser, String ip, ProceedingJoinPoint joinPoint, UmsLog umsLog) {

        MethodSignature signature = (MethodSignature) joinPoint.getSignature();
        Method method = signature.getMethod();
        Log aopLog = method.getAnnotation(com.gu.tiny.common.annotation.Log.class);

        // 方法路径
        String methodName = joinPoint.getTarget().getClass().getName() + "." + signature.getName() + "()";

        StringBuilder params = new StringBuilder("{");
        //参数值
        List<Object> argValues = new ArrayList<>(Arrays.asList(joinPoint.getArgs()));
        //参数名称
        for (Object argValue : argValues) {
            params.append(argValue).append(" ");
        }
        // 描述
        if (ObjectUtil.isNotEmpty(umsLog)) {
            umsLog.setDescription(aopLog.value());
        }
        assert umsLog != null;
        umsLog.setRequestIp(ip);

        String loginPath = "login";
        if (loginPath.equals(signature.getName())) {
            try {
                username = new JSONObject(argValues.get(0)).get("username").toString();
            } catch (Exception e) {
                log.error(e.getMessage(), e);
            }
        }
        umsLog.setAddress(StringUtils.getCityInfo(umsLog.getRequestIp()));
        umsLog.setMethod(methodName);
        umsLog.setUsername(username);
        umsLog.setUrl(url);
        umsLog.setParams(params.toString() + " }");
        umsLog.setBrowser(browser);
        umsLog.setCreateTime(new Date());
        umsLogMapper.insert(umsLog);
    }

    @Override
    public Page<UmsLog> list(String keyword, Integer pageSize, Integer pageNum) {
        Page<UmsLog> page = new Page<>(pageNum, pageSize);
        QueryWrapper<UmsLog> wrapper = new QueryWrapper<>();
        LambdaQueryWrapper<UmsLog> lambda = wrapper.lambda();
        if (StrUtil.isNotEmpty(keyword)) {
            lambda.like(UmsLog::getUsername, keyword);
        }
        return page(page, wrapper);
    }


}
