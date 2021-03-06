import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.Date;

void clova(String s) {
    try {
        String text = URLEncoder.encode(s, "UTF-8"); // 13자
        URL url = new URL(apiURL);
        HttpURLConnection con = (HttpURLConnection)url.openConnection();
        con.setRequestMethod("POST");
        con.setRequestProperty("X-NCP-APIGW-API-KEY-ID", clientId);
        con.setRequestProperty("X-NCP-APIGW-API-KEY", clientSecret);
        // post request
        String postParams = "speaker=mijin&speed=0&text=" + text;
        con.setDoOutput(true);
        DataOutputStream wr = new DataOutputStream(con.getOutputStream());
        wr.writeBytes(postParams);
        wr.flush();
        wr.close();
        int responseCode = con.getResponseCode();

        BufferedReader br;
        if (responseCode==200) { // 정상 호출
            InputStream is = con.getInputStream();
            int read = 0;
            byte[] bytes = new byte[2048];
            // 랜덤한 이름으로 mp3 파일 생성
            String tempname = Long.valueOf(new Date().getTime()).toString();
            File f = new File(dataPath(tempname + ".mp3"));
            file = (dataPath(tempname + ".mp3"));
            f.createNewFile();
            OutputStream outputStream = new FileOutputStream(f);
            while ((read = is.read(bytes)) != -1) {
                outputStream.write(bytes, 0, read);
            }
            is.close();
        } else {  // 에러 발생시
            br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
            String inputLine;
            StringBuffer response = new StringBuffer();
            while ((inputLine = br.readLine()) != null) {
                response.append(inputLine);
            }
            br.close();
            System.out.println(response.toString());
        }
    } 
    catch (Exception e) {
        System.out.println(e);
    }
    soundfile = minim.loadFile(file);
    soundfile.play();
}
