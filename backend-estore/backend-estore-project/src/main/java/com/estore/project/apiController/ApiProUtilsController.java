package com.estore.project.apiController;


import com.estore.common.annotation.Anonymous;
import com.estore.common.config.RuoYiConfig;
import com.estore.common.core.domain.AjaxResult;
import com.estore.common.core.redis.RedisCache;
import com.estore.common.utils.ServletUtils;
import com.estore.common.utils.file.FileUploadUtils;
import com.estore.common.utils.file.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

@Anonymous
@RestController
@RequestMapping("/api/utils")
public class ApiProUtilsController {

    @Autowired
    private RedisCache redisCache;


    @PostMapping("/upload")
    public AjaxResult uploadIimage(MultipartFile file) throws IOException {
        try
        {
            // 上传文件路径
            String filePath = RuoYiConfig.getUploadPath();
            // 上传并返回新文件名称
            String fileName = FileUploadUtils.upload(filePath, file);
            String url = getUrl() + fileName;
            System.out.println(getUrl());
            AjaxResult ajax = AjaxResult.success();
            ajax.put("url", url);
            ajax.put("fileName", fileName);
            ajax.put("newFileName", FileUtils.getName(fileName));
            ajax.put("originalFilename", file.getOriginalFilename());
            return AjaxResult.success(ajax);
        }
        catch (Exception e)
        {
            return AjaxResult.error(e.getMessage());
        }
    }

    /**
     * 获取完整的请求路径，包括：域名，端口，上下文访问路径
     *
     * @return 服务地址
     */
    public String getUrl()
    {
        HttpServletRequest request = ServletUtils.getRequest();
        return getDomain(request);
    }

    public static String getDomain(HttpServletRequest request)
    {
        StringBuffer url = request.getRequestURL();
        String contextPath = request.getServletContext().getContextPath();
        return url.delete(url.length() - request.getRequestURI().length(), url.length()).append(contextPath).toString();
    }



}
