
# ffmpeg

[FFMPEG详解(完整版）](https://blog.csdn.net/davidullua/article/details/120562737)




- 使用优酷内置ffmpeg，转换优酷客户端下载的视频文件
  - xxx.bat
~~~
@echo off
setlocal enabledelayedexpansion
set ffmpeg="C:\Program Files (x86)\YouKu\YoukuClient\nplayer\ffmpeg.exe"
if exist %ffmpeg% (
        for /r . %%i in (*.kux) do (
                %ffmpeg% -y -i "%%i" -c:a copy -c:v copy -threads 2 "%%~dpni.mp4"
                    )
    ) else echo 请检查本程序优酷客户端里的ffmpeg路径！

\\作者：王逸雪
\\链接：https://www.zhihu.com/question/51792949/answer/298412575
\\来源：知乎
\\著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。

\\C:\Program Files (x86)\YouKu\YoukuClient\nplayer\ffmpeg.exe -y -i
\\  "F:\电影\xxx乐队_1080p.kux" -c:v copy -c:a copy -threads 2
\\  "F:\电影\xxx乐队_1080p.kux.mp4"

\\ C:\Program Files (x86)\YouKu\YoukuClient\nplayer\
~~~

