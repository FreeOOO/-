package Service;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class GetMD5 {
	private final static String[] strDigits = { "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "a", "b", "c", "d", "e", "f" };
	public static String getMd5(String str){
		StringBuffer sBuffer = new StringBuffer();
		try {
			MessageDigest md = MessageDigest.getInstance("MD5");
			byte []bByte = md.digest(str.getBytes());
	        for (int i = 0; i < bByte.length; i++) {
	            sBuffer.append(byteToArrayString(bByte[i]));
	        }
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		return new String(sBuffer);
	}
	private static String byteToArrayString(byte bByte) {
        int iRet = bByte;
        if (iRet < 0) {
            iRet += 256;
        }
        int iD1 = iRet / 16;
        int iD2 = iRet % 16;
        return strDigits[iD1] + strDigits[iD2];
    }
}
