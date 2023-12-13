package com.estore.common.utils;

import com.aliyun.oss.OSS;
import com.aliyun.oss.OSSClient;
import com.aliyun.oss.OSSClientBuilder;
import com.aliyun.oss.model.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.*;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;


public class OssUtil {
	
	public static String uploadIimage(MultipartFile file) throws IOException {

		System.out.println(file);
		// 创建OSSClient的实例
		OSSClient ossClient = new OSSClient(endpoint, accessKeyId, accessKeySecret);

		// 判断容器是否存在,不存在就创建
		if (!ossClient.doesBucketExist(backName)) {
			ossClient.createBucket(backName);
			CreateBucketRequest createBucketRequest = new CreateBucketRequest(backName);
			createBucketRequest.setCannedACL(CannedAccessControlList.PublicRead);
			ossClient.createBucket(createBucketRequest);
		}
		// 设置文件名称
		String uuid = System.currentTimeMillis()+"."+getFileExtension(file.getOriginalFilename());
		// 上传的文件不是空，并且文件的名字不是空字符串
		if (file.getSize() != 0 && !"".equals(file.getName())) {
			ObjectMetadata om = new ObjectMetadata();
			om.setContentLength(file.getSize());
			// 设置文件上传到服务器的名称
			om.addUserMetadata("filename", uuid);
			try {
				ossClient.putObject(backName, uuid, new ByteArrayInputStream(file.getBytes()), om);
				System.out.println(ossClient);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		// 设置这个文件地址的有效时间
		Date expiration = new Date(new Date().getTime() + 3600l * 1000 * 24 * 365 * 10);
		URL url = ossClient.generatePresignedUrl(backName, uuid, expiration);
		ossClient.setBucketAcl(backName, CannedAccessControlList.PublicRead);
		ossClient.shutdown();
		return "https://" + url.getAuthority() + "/" + uuid;
	}

	// 分页

	public static String multipartUpload(String objectName, File sampleFile) {
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd hh-mm-ss");
		String bucketName = backName;
		// 创建OSSClient实例。
		OSS ossClient = new OSSClientBuilder().build(endpoint, accessKeyId, accessKeySecret);
		// 创建InitiateMultipartUploadRequest对象。
		InitiateMultipartUploadRequest request = new InitiateMultipartUploadRequest(bucketName, objectName);
		// 初始化分片。
		InitiateMultipartUploadResult upresult = ossClient.initiateMultipartUpload(request);
		// 返回uploadId，它是分片上传事件的唯一标识，您可以根据这个ID来发起相关的操作，如取消分片上传、查询分片上传等。
		String uploadId = upresult.getUploadId();
		// partETags是PartETag的集合。PartETag由分片的ETag和分片号组成。
		List<PartETag> partETags = new ArrayList<PartETag>();
		// 计算文件有多少个分片。
		final long partSize = 1 * 1024 * 1024L; // 1MB
		// final File sampleFile = new File("<localFile>");
		long fileLength = sampleFile.length();
		int partCount = (int) (fileLength / partSize);
		if (fileLength % partSize != 0) {
			partCount++;
		}
		try {
			// 遍历分片上传。
			for (int i = 0; i < partCount; i++) {
				long startPos = i * partSize;
				long curPartSize = (i + 1 == partCount) ? (fileLength - startPos) : partSize;
				InputStream instream = null;
				instream = new FileInputStream(sampleFile);
				// 跳过已经上传的分片。
				instream.skip(startPos);
				UploadPartRequest uploadPartRequest = new UploadPartRequest();
				uploadPartRequest.setBucketName(bucketName);
				uploadPartRequest.setKey(objectName);
				uploadPartRequest.setUploadId(uploadId);
				uploadPartRequest.setInputStream(instream);
				// 设置分片大小。除了最后一个分片没有大小限制，其他的分片最小为100KB。
				uploadPartRequest.setPartSize(curPartSize);
				// 设置分片号。每一个上传的分片都有一个分片号，取值范围是1~10000，如果超出这个范围，OSS将返回InvalidArgument的错误码。
				uploadPartRequest.setPartNumber(i + 1);
				// 每个分片不需要按顺序上传，甚至可以在不同客户端上传，OSS会按照分片号排序组成完整的文件。
				UploadPartResult uploadPartResult = ossClient.uploadPart(uploadPartRequest);
				// 每次上传分片之后，OSS的返回结果会包含一个PartETag。PartETag将被保存到partETags中。
				partETags.add(uploadPartResult.getPartETag());
			}
			// 创建CompleteMultipartUploadRequest对象。
			// 在执行完成分片上传操作时，需要提供所有有效的partETags。OSS收到提交的partETags后，会逐一验证每个分片的有效性。当所有的数据分片验证通过后，OSS将把这些分片组合成一个完整的文件。
			CompleteMultipartUploadRequest completeMultipartUploadRequest = new CompleteMultipartUploadRequest(
					bucketName, objectName, uploadId, partETags);
			// 如果需要在完成文件上传的同时设置文件访问权限，请参考以下示例代码。
			// completeMultipartUploadRequest.setObjectACL(CannedAccessControlList.PublicRead);
			// 完成上传。
			CompleteMultipartUploadResult completeMultipartUploadResult = ossClient
					.completeMultipartUpload(completeMultipartUploadRequest);
			System.err.println(formatter.format(new Date()) + "oss结束");
			System.err.println("================================================");
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			// 关闭OSSClient。
			if (ossClient != null) {
				ossClient.shutdown();
			}
		}
		return "https://shilihuifu.oss-cn-beijing.aliyuncs.com/" + objectName;
	}
	
	//上传Byte数组
	public static String insertByte(byte[] content){
		// 创建OSSClient实例。
		OSS ossClient = new OSSClientBuilder().build(endpoint, accessKeyId,accessKeySecret);
		// 填写Bucket名称和Object完整路径。Object完整路径中不能包含Bucket名称。
		String uuid=new Date().getTime()+".png";
		ossClient.putObject(backName, uuid, new ByteArrayInputStream(content));
		Date expiration = new Date(new Date().getTime() + 3600l * 1000 * 24 * 365 * 10);
		URL url = ossClient.generatePresignedUrl(backName, uuid, expiration);
		ossClient.setBucketAcl(backName, CannedAccessControlList.PublicRead);
		ossClient.shutdown();
		return "https://" + url.getAuthority() + "/" + uuid;
	}

	public static File multipartFileToFile(MultipartFile file) throws Exception {
		File toFile = null;
		if (file.equals("") || file.getSize() <= 0) {
			file = null;
		} else {
			InputStream ins = null;
			ins = file.getInputStream();
			toFile = new File(file.getOriginalFilename());
			inputStreamToFile(ins, toFile);
			ins.close();
		}
		return toFile;
	}

	public static String getFileExtension(String filename) {
		if (filename != null && !filename.isEmpty()) {
			int dotIndex = filename.lastIndexOf(".");
			if (dotIndex > 0 && dotIndex < filename.length() - 1) {
				return filename.substring(dotIndex + 1);
			}
		}
		return "";
	}
	
	private static void inputStreamToFile(InputStream ins, File file) {
        try {
            OutputStream os = new FileOutputStream(file);
            int bytesRead = 0;
            byte[] buffer = new byte[8192];
            while ((bytesRead = ins.read(buffer, 0, 8192)) != -1) {
                os.write(buffer, 0, bytesRead);
            }
            os.close();
            ins.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

	public static boolean removeImage(MultipartFile file, HttpServletRequest request) throws IOException {
		boolean a = true;
		System.gc();
		String uuid = file.getOriginalFilename();
		String filePath = "/www/SpringBootProjects/shilihuifu" + uuid;
		File file2 = new File(filePath);
		if (file2.isFile() && file2.exists()) {
			a = file2.delete();
		}
		return a;
	}
    //播放时间
//	public static String upLoadFile(MultipartFile multipartFile) {
//		File newFile = null;
//		String time = "";
//		try {
//			String filename = multipartFile.getOriginalFilename();
//			if (multipartFile != null) {
//				if (!"".equals(filename.trim())) {
//					newFile = new File(filename);
//					FileOutputStream os = new FileOutputStream(newFile);
//					os.write(multipartFile.getBytes());
//					os.close();
//					multipartFile.transferTo(newFile);
//					Encoder encoder = new Encoder();
//					try {
//						MultimediaInfo m = encoder.getInfo(newFile);
//						long ls = m.getDuration();
//						time = ls / 60000 + ":" + (ls % 60000) / 1000;
//					} catch (Exception e) {
//						e.printStackTrace();
//					}
//				}
//			}
//		} catch (Exception ex) {
//			ex.printStackTrace();
//		}
//
//		return time;
//	}

	public static void removeFile(String images) {
		if (images != null && !"".equals(images)) {
			String bucketName = backName;
			String[] j = images.split("/");
			String objectName = j[3];
			// 创建OSSClient实例。
			OSS ossClient = new OSSClientBuilder().build(endpoint, accessKeyId, accessKeySecret);
			// 删除文件。如需删除文件夹，请将ObjectName设置为对应的文件夹名称。如果文件夹非空，则需要将文件夹下的所有object删除后才能删除该文件夹。
			ossClient.deleteObject(bucketName, objectName);
			// 关闭OSSClient。
			ossClient.shutdown();
		}
	}
}
