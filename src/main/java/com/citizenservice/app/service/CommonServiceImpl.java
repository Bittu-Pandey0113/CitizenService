/*
 * package com.citizenservice.app.service;
 * 
 * import java.nio.file.Files; import java.nio.file.Path; import
 * java.nio.file.Paths;
 * 
 * import org.springframework.stereotype.Service; import
 * org.springframework.web.multipart.MultipartFile;
 * 
 * @Service public class CommonServiceImpl implements CommonService {
 * 
 * @Override public String saveImage(MultipartFile uploadFile) throws Exception
 * { String folder="c:/photos/"; byte[] bytes = uploadFile.getBytes(); Path path
 * = Paths.get(folder+uploadFile.getOriginalFilename()); Files.write(path,
 * bytes); return folder+uploadFile.getOriginalFilename(); }
 * 
 * }
 */