<html>
    <head>
        <link href="public/client/css/404error.css" rel="stylesheet"/>
    </head>
    <body>
        <div id="main">
            <div id="msg">Không tìm thấy trang</div>
            <div id="error">
                <div id="f1">4</div>
                <div id="circle">
                    <div id="smalldot"></div>
                </div>
                <div id="f2">4</div>
            </div>
            
            <div id="info">Chúng tôi dường như không thể tìm thấy trang<br>bạn đang tìm</div>
            
            <div onclick="trangchu()" id="btn">Trang chủ</div>
            <script>
                function trangchu()
                {
                    window.location.href = '/';
                }
            </script>
        </div>  
        
        <div id="ring"></div>
        
        <div class="dusk" id="d1"></div>
        <div class="dusk" id="d2"></div>
        <div class="dusk" id="d3"></div>
        <div class="dusk" id="d4"></div>
        <div class="dusk" id="d5"></div>
        <div class="dusk" id="d6"></div>
        <div class="dusk" id="d7"></div>
        <div class="dusk" id="d8"></div>
        <div class="dusk" id="d9"></div>
    </body>
</html>