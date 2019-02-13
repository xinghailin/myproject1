  if (window.opener) {
        var url = window.location.href;
        var str = url.match(/access_token=\w*&/);
        if (str.length > 0) {
            str[0] = str[0].replace(/access_token=(\w*)&/, '$1');
            window.opener.vcop.authtoken = str[0];
            window.close();
        }
    }

    var info = document.getElementById("info");
    var info2 = document.getElementById("info2");
    
    var btn = document.getElementById("testupload");
    var btnStartUpload = document.getElementById("btnstart");
    var btnstar = document.getElementById("divstartup");
    var per = document.getElementById("percent");
    var token = document.getElementById("token");
    var page = document.getElementById("pageNum");
    var pagecount = document.getElementById("pageCount");
    var delfile = document.getElementById("delfileid");
    var deltype = document.getElementById("deltype");
    var retoken=document.getElementById("retoken");
    var mgrurl=document.getElementById("mgrUrl");
    
    var fileName = document.getElementById("fileName").value;//文件名称
    var description=document.getElementById("description").value;//文件描述
    
    var vcop = new Q.vcopClient({
        uploadBtn:{
            dom:btn,
            btnH:"32px",
            btnW:"62px",
            btnT:"100px",
            btnL:"100px",
            btnZ:"999",
            hasBind:false},
        appKey:"5de2a851aba444b184f6b95393940729",  // 填写申请的app key 
        appSecret:"a54f59019e208e11608a0c546e2a3bb1", // 填写app secret
        managerUrl:"http://openapi.iqiyi.com/",
        uploadUrl:"http://upload.iqiyi.com/",
		needMeta:false
    });
    var fileinfo = {};
    var _refresh=null;
    
    // 8-28 服务器地址修改
    function changeMgrUrl(){
        if(mgrurl.value){
            vcop.resetApiUrl(mgrurl.value);
        }
    }
    
    // 8-27 获取版本号
    function getVer(){
        info.innerHTML = vcop.getSDKVersion();
    }
        
    // 5-27 企业级授权
    function getEntAuth(){
        vcop.getAuthEnterprise(function (data) {
            if(data){
                info.innerHTML = JSON.stringify(data);
                vcop.authtoken = data.data.access_token;
                _refresh = data.data.refresh_token
                if(/msie/.test(navigator.userAgent.toLowerCase())){
                    initUpload();
                }
                
                if(uoploader){
                    uoploader.initOneFile({btnW:"100px",btnH:"100px",btnT:"100px",btnL:"12px"});
                }
            }
        });
    }
    
    // 8-06 个人授权
    function getPerAuth(){
        vcop.getAuthPerson({uid:"1016614329"},function (data) {
            if(data && data.data){
                info.innerHTML = JSON.stringify(data);
                vcop.authtoken = data.data.access_token;
                _refresh = data.data.refresh_token
                if(/msie/.test(navigator.userAgent.toLowerCase())){
                    initUpload();
                }
                if(uoploader){
                    uoploader.initOneFile({btnW:"100px",btnH:"100px",btnT:"100px",btnL:"12px"});
                }
            }
        });
    }

    function refreshauth(){
        vcop.refreshToken({
        grant_type:'refresh_token',
        refresh_token:retoken.value
        },function(data){
            if(data.code !== 'A00000'){
                info.innerHTML = data.msg;
            }
            else{
                info.innerHTML = "authtoken:"+data.access_token+"<br/>refresh token:"+data.refresh_token
            }
        })
    }
    
    var uoploader=null;  // 上传
    
    // 5/3 重置按钮
    var btn2=document.getElementById("resetBtn");
    function resetBtn(){
        vcop.resetBtn({
            uploadBtn:{dom:btn2,
                btnW:"100px",
                btnH:"100px",
                btnT:"100px",
                btnL:"100px",
                btnZ:"999",
                hasBind:false
            }
        });
        var f= document.getElementsByTagName("objcet");
    }
    
    function initUpload() {
    	
//        if (!vcop.authtoken) {
            getEntAuth();;
//        }
//        else {
            uoploader=vcop.initUpload({
				slicesize:1024*128,
                access_token:vcop.authtoken, 
                device_id:"test", 
                uid:"test",
                allowType:["xv","avi","dat","mpg","mpeg","vob","mkv","mov","wmv","asf","rm","rmvb","ram","flv","mp4","3gp","dv","qt","divx","cpk","fli","flc","m4v","pfv"]  // 重置类型
                }, {
                onSuccess:function (data) {
                    if(data && data.data){
                    	document.getElementById("delfileid").value=data.data.file_id;//lkd赋值 然后将上传之后的状态保存到status里面
                        info.innerHTML = data.data.file_id;
                        fileinfo = data.data;
                        btnstar.style.display = "block";
                        btnStartUpload.style.display="block";
                        //给出提示信息
                        document.getElementById("videoMessage").style.display="block";//显示
                        
                    }
                },
                onError:function (data) {
                    if (data && data.msg) {
                        info.innerHTML = data.msg;
                    }
                    else{
                        info.innerHTML = "网络错误"
                        alert('网络错误，请稍后再试!')
                    }
                }}
            );
//        }

    }

    var breakdown=false;
    function sartUpload() {     
    	setMeta();//手工设置meta
    // 20130819 需手工设置meta(调用setMeta函数),否则返回错误
    // 20130830 隐藏上传按钮
        uoploader.startUpload(fileinfo, {
            onFinish:function (data) {
                if (data && data.manualFinish === true) {
                    uoploader.finishUpload({
                        onSuccess:function () {
                        	var target=document.getElementById("confirmBtn");
                        	
                            //info.innerHTML = "上传成功";
                            document.getElementById("videoMessage").style.display="none"; //显示
                            document.getElementById("videoMessageSuccess").style.display="block"; //显示
                        },
                        onError:function () {
                            info.innerHTML = "上传失败";
                        }
                    });
                }
                else
                    info.innerHTML = "上传成功";
                setTimeout(function () {
                    uoploader.delLocal(fileinfo.file_name,fileinfo.file_id);     // 20141227
                    resetPer();
                }, 2000)
            },
            onError:function (data) {
                if(data.msg){
                    info.innerHTML = data.msg;
                    // 续传
                    if(data.msg=='network break down'){
                        breakdown=true;
                        uoploader.pauseUpload();
                    }
                }
                else{
                    info.innerHTML = "上传失败";
                }
                
            },
            onProgress:function (data) {    // 5/7 增加速度，剩余时间
                per.style.width = data.percent + "%";
                info2.innerHTML="上传中..速度："+data.speed+"kb/s , 剩余时间："+data.remainTime + "s";
            }
        });
        btnStartUpload.style.display="none";
        btn.style.display="none";
    }
    
    function pauseUpload() {
        uoploader.pauseUpload(function(data){
            breakdown=data;
        });
    }

    function resumeUpload() {
        uoploader.resumeUpload({
            onFinish:function (data) {
                if (data && data.manualFinish === true) {
                    uoploader.finishUpload({
                        onSuccess:function () {
                            info.innerHTML = "上传成功";
                        },
                        onError:function () {
                            info.innerHTML = "上传失败";
                        }
                    });
                }
                else
                    info.innerHTML = "上传成功";
                
                setTimeout(function () {
                    resetPer();
                }, 600)
            },
            onError:function (data) {
                info.innerHTML = "上传失败";
            },
            onProgress:function (data) {
                per.style.width = data.percent + "%";
                info.innerHTML="上传中....速度："+data.speed+"kb/s , 剩余时间："+data.remainTime + "s";
            }
        },breakdown);   // 续传传参
    }
    
    function startBreakPoint(){
        if(!breakdown){
            return;
        }
        var breakfile=fileinfo;
        breakfile.thefile = uoploader.uploader.currentFile;
        breakfile.forstart=breakdown.realend;
        breakfile.handler = {
            onFinish:function (data) {
                if (data && data.manualFinish === true) {
                    uoploader.finishUpload({
                        onSuccess:function () {
                            info.innerHTML = "上传成功";
                        },
                        onError:function () {
                            info.innerHTML = "上传失败";
                        }
                    });
                }
                else
                    info.innerHTML = "上传成功";
                
                setTimeout(function () {
                    uoploader.delLocal(fileinfo.file_name,fileinfo.file_id);    // 20141227
                    resetPer();
                }, 600)
            },
            onError:function (data) {
                info.innerHTML = "上传失败";
            },
            onProgress:function (data) {
                per.style.width = data.percent + "%";
                info.innerHTML="上传中....速度："+data.speed+"kb/s , 剩余时间："+data.remainTime + "s";
            }
        };
        uoploader.breakResume(breakfile);
    }

    function cancelUpload() {
        uoploader.cancelUpload({
            onSuccess:function (data) {                
                info.innerHTML = "已取消";
                setTimeout(function () {
                    resetPer();
                }, 600)
            },
            onError:function (data) {
                if(data && data.code)
                    info.innerHTML = "取消失败";
                else
                    info.innerHTML = "网络错误";
            }
        });
    }

    function setMeta() {
        vcop.setMetadata({
            file_id:fileinfo.file_id,
            file_name:document.getElementById("fileName").value,
            description:document.getElementById("description").value, 
            uploader:uoploader          // 20130819 需手工设置meta
        }, function (data) {
            info.innerHTML = data.code;
        })
    }

    function getVedios() {
        vcop.getVideoInfo({
            file_ids:delfile.value!=="" ? delfile.value : ""
        }, function (data) {
            if(data)    info.innerHTML = JSON.stringify(data);
        })
    }

    function getVideoCount() {
        vcop.getVideoCount({},
            function (data) {
                if(data)    info.innerHTML = JSON.stringify(data);
            })
    }
    
    function getStatus(){   // 20130827 查状态
        vcop.getFileStatus({
            file_id:delfile.value!=="" ? delfile.value : ""
        },function (data) {
            if(data)    info.innerHTML = JSON.stringify(data);
        })
    }

    function getVideosPage() {
        vcop.getVideoListPage({page_size:pagecount.value, page:page.value},
            function (data) {
                if(data)    info.innerHTML = JSON.stringify(data);
            })
    }

    function delFile() {
        vcop.delVideoById({delete_type:deltype.value, file_ids:delfile.value},
            function (data) {
                if(data)    info.innerHTML = JSON.stringify(data);
            })
    }

    function resetPer() {
        per.style.width = "0%";
        btnstar.style.display = "none";
        info.innerHTML='';
        uoploader=null;
        btn.style.display='';
        
    }
    
    // 5-8 ie下初始化页面的时候获取token，取得token后调用initUpload，返回uploader，调用uploader.initOneFile({位置})
    window.onload=function(){
        if(/msie/.test(navigator.userAgent.toLowerCase())){
             getEntAuth();
        }
    };