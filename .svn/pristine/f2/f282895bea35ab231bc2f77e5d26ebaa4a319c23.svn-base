/**
 * @fileOverview validation控件代理类: 主要用于配置验证框架在项目级别的默认属性，以及通用的校验规则
 * @requires validation
 * @version 1.0.0
 */
define(function (require, exports) {
    'use strict';
    require('./myvalidation')($);
    /**
     * 配置验证框架项目级别的默认属性
     */
    $.validator.setDefaults({
        onkeyup: false,  //input域：键盘keyup事件不触发校验
        onfocusout: false, //input域：失去焦点事件不触发校验
        focusCleanup: true,
        focusInvalid: false,
        errorClass: "invalid",
        errorPlacement: function (error, element) {
            element.siblings('.el-error').empty().append(error);
        },
        highlight: function () { //覆盖validation控件highlight方法，防止控件的highlight方法将校验错误样式强制加入到每个input域
            return false;
        },
        //每个input域校验通过之后的回调处理：移除显示错误信息的label元素
        success: function (element) { //@param {object} [element = 显示错误信息的Label元素（jQuery对象）]
            element.remove();
        },
        submitHandler: function(form){
            $(form).find('[type=submit]').prop('disabled', true).addClass('disabled');  //禁用表单按钮防止重复提交
            form.submit();
        }
    });

    /**
     * 手机校验规则
     */
    $.validator.addMethod("mobile", function (value) {
        if (value === '') {
            return true;
        }
        return (/^1[3-9]\d{9}$/).test(value);
    }, "手机号码格式错误");

    /**
     *   金额格式进行验证
     *
     */
    $.validator.addMethod("amount", function (value) {
        if (value === '') {
            return true;
        }
        return (/^((([1-9])+\d*)|0)((\.[0-9]{1,2}){0,1})$/).test(value);
    },'请输入正确的金额');
    

    /**
     *   配合后台远程校验方法使用的自定义方法
     *   @param {object} [options={}] options for addRemoteValidation.
     *   @example
     *   //添加自定义远程验证方法
     *   validationProxy.addRemoteValidation({
     *       name: 'validIdCard', //方法名
     *       url: '/json/validate/idCard',//验证url
     *       type: 'post', //验证请求类型
     *       dataKey: "idCard"  //参数名称
     *   });
     */
    exports.addRemoteValidation = function (options) {
        var invalidMsg = '';
        var invalidMsgFunc = function () {
            return invalidMsg;
        };
        $.validator.addMethod(options.name, function (value) {
            var result = false;
            if(options.security){   //数据要求加密处理的情况
                //TODO:
//                require('base64')($);
//                value = $.base64Encode(value);
            }
            $.ajax(options.url, {
                async: false,
                type: options.type || 'get',
                dataType: options.dataType || 'json',
                data: options.dataKey ? options.dataKey + "=" + encodeURI(value) : options.data||{}
            }).success(function (data) {
                    invalidMsg = data.message;
                    result = data.success;
                }).error(function () {
                    invalidMsg = "系统内部异常";
                    result = false;
                });
            return result;
        }, invalidMsgFunc);
    };

    /**
     * 中文校验规则
     */
    $.validator.addMethod("chinese", function (value) {
        return (/^[\u4e00-\u9fa5]+$/).test(value);
    }, "输入字符必须为中文");

    $.validator.addMethod("number", function (value) {
        return (/^[+-]?[0-9]{1,3}(?:,?[0-9]{3})*(?:\.[0-9]{1,2})?$/).test(value);
    }, "输入必须为数字且小数点后最多2位");
    $.validator.addMethod("numberOrSpace", function (value) {
    	if (value === '') {
            return true;
        }
        return (/^[+-]?[0-9]{1,3}(?:,?[0-9]{3})*(?:\.[0-9]{1,2})?$/).test(value);
    }, "输入必须为数字且小数点后最多2位");
    //2013-08-22
    $.validator.addMethod("date", function (value) {
        return (/(([0-9]{3}[1-9]|[0-9]{2}[1-9][0-9]{1}|[0-9]{1}[1-9][0-9]{2}|[1-9][0-9]{3})-(((0[13578]|1[02])-(0[1-9]|[12][0-9]|3[01]))|((0[469]|11)-(0[1-9]|[12][0-9]|30))|(02-(0[1-9]|[1][0-9]|2[0-8]))))|((([0-9]{2})(0[48]|[2468][048]|[13579][26])|((0[48]|[2468][048]|[3579][26])00))-02-29)/).test(value);
    }, "格式不正确");
  //2013-08-22
    $.validator.addMethod("dateorspace", function (value) {
    	if (value === '') {
            return true;
        }
        return (/(([0-9]{3}[1-9]|[0-9]{2}[1-9][0-9]{1}|[0-9]{1}[1-9][0-9]{2}|[1-9][0-9]{3})-(((0[13578]|1[02])-(0[1-9]|[12][0-9]|3[01]))|((0[469]|11)-(0[1-9]|[12][0-9]|30))|(02-(0[1-9]|[1][0-9]|2[0-8]))))|((([0-9]{2})(0[48]|[2468][048]|[13579][26])|((0[48]|[2468][048]|[3579][26])00))-02-29)/).test(value);
    }, "格式不正确");
    //2013-08-22 23:10(不带秒的日期格式)
    $.validator.addMethod("time", function (value) {
        return (/((([0-9]{3}[1-9]|[0-9]{2}[1-9][0-9]{1}|[0-9]{1}[1-9][0-9]{2}|[1-9][0-9]{3})-(((0[13578]|1[02])-(0[1-9]|[12][0-9]|3[01]))|((0[469]|11)-(0[1-9]|[12][0-9]|30))|(02-(0[1-9]|[1][0-9]|2[0-8]))))|((([0-9]{2})(0[48]|[2468][048]|[13579][26])|((0[48]|[2468][048]|[3579][26])00))-02-29)) (20|21|22|23|[0-1]?\d):[0-5]?\d$/).test(value);
    }, "格式不正确");
    //2013-08-22 23:10:10
    $.validator.addMethod("timeSecond", function (value) {
        return (/((([0-9]{3}[1-9]|[0-9]{2}[1-9][0-9]{1}|[0-9]{1}[1-9][0-9]{2}|[1-9][0-9]{3})-(((0[13578]|1[02])-(0[1-9]|[12][0-9]|3[01]))|((0[469]|11)-(0[1-9]|[12][0-9]|30))|(02-(0[1-9]|[1][0-9]|2[0-8]))))|((([0-9]{2})(0[48]|[2468][048]|[13579][26])|((0[48]|[2468][048]|[3579][26])00))-02-29)) (20|21|22|23|[0-1]?\d):[0-5]?\d:[0-5]\d$/).test(value);
    },"格式不正确");
   
    /**
     * 密码检查: 长度至少6位，其中包含是字母，数字，特殊字符两两组合
     */
    $.validator.addMethod("pwdCheck", function (value) {
        var pwdRegex = /^[a-zA-Z\d\W_]*(?=[a-zA-Z\d\W\s_]{6,})(((?=[a-zA-Z\d\W\s_]*[A-Za-z])(?=[a-zA-Z\d\W\s_]*[\d]))|((?=[a-zA-Z\d\W\s_]*[A-Za-z])(?=[a-zA-Z\d\W\s_]*[\W_]))|((?=[a-zA-Z\d\W\s_]*[\d])(?=[a-zA-Z\d\W\s_]*[\W\s_])))[a-zA-Z\d\W\s_]*$/;
        return pwdRegex.test(value);
    }, '密码至少6位， 必须是字母，数字，特殊字符的两两组合');

    /**
     * 空格字符检查
     */
    $.validator.addMethod("whiteSpaceCheck", function (value) {
        //不能有空格
        return !/\s+/.test(value);
    }, '密码中不能有空格');

    /**
     * 不等于
     */
    $.validator.addMethod("notEqualTo", function (value, element, param) {
        return value !== $(param).val();
    });
    
    
    /**
     *   金额格式进行验证
     */
    $.validator.addMethod("amountFmtCheck", function (value) {
        return (/^((([1-9])+\d*)|0)((\.[0-9]{1,2}){0,1})$/).test(value);
    },'金额格式错误');
   
    /**
     *  包含小数的数字格式校验
     */
    $.validator.addMethod("figureFmtCheck", function (value) {
    	if(value==null||value==''){
    		return true ;
    	}else{
    		if(value.indexOf(".")>0){
    			var dig= value.split(".");
    			if(dig[0].length>3)//正整数部分超过3位 则非法 小数部分只允许1到2位
    				return false ;
    			 return (/^((([1-9])+\d*)|0)((\.[0-9]{1,2}){0,1})$/).test(value);
    		}else{
    			if(value.length>3)//正整数部分超过3位 则非法
    				return false ;
    			return (/^\d*$/).test(value);
    		}
    	}
    },'数字格式错误');
    
    
    /*
     * 当审核状态为不通过的时候  判断备注是否为空
     */
    $.validator.addMethod("remarkApprove", function (value) {
       if(value==0){
    	   var remarkValue = $('#remark').val() ;
    	   if(remarkValue == null||remarkValue == ''){
    		   return false ;
    	   }else{
    		   return true ;
    	   }
       }else{
    	   return true ;
       }
    }, '备注不能为空');

    /**
     *   正整数数字格式进行验证
     *
     */
    $.validator.addMethod("numberFmtCheck", function (value) {
        return (/^\d*$/).test(value);
    },'数字格式错误');
    
    /**
     *   正整数数字格式或者不填进行验证
     *
     */
    $.validator.addMethod("integerOrSpace", function (value) {
    	if (value === '') {
            return true;
        }
        return (/^0|[1-9][0-9]*$/).test(value);
    },'数字格式错误');

    /**
     *   正整数数字格式或者不填进行验证
     *
     */
    $.validator.addMethod("integergtzero", function (value) {
        return (/^[1-9][0-9]*$/).test(value);
    },'请输入大于0的整数');
    
    /**
     *   数字和（大小写）字母格式进行验证
     *
     */
    $.validator.addMethod("numberAndCharsFmtCheck", function (value) {
        return  (/^([A-Z]|[a-z]|[\d])*$/).test(value);
    },'数字和字母格式错误');
    
    /**
     * EMAIL 验证
     * 
     */
    $.validator.addMethod("emailCheck", function (value) {
        return  (/^([a-zA-Z0-9]+[_|\-|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\-|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/gi).test(value);
    },'邮箱格式错误');
    
    /**
     * 身份证号码验证
     * 
     */
    $.validator.addMethod("cardNoCheck",function(value,element){  
        return this.optional(element) || /^(\d{14}|\d{17})(\d|[xX])$/.test(value);  
       });
    
    /**
     * 身份证号码验证或不填
     * 
     */
    $.validator.addMethod("cardNoCheckOrSpace",function(value,element){
    	if (value === '') {
            return true;
        }
        return this.optional(element) || /^(\d{14}|\d{17})(\d|[xX])$/.test(value);  
       });
    /**
     * 只判断角色名称格式是否正确
     */
    $.validator.addMethod("roleNameFormatCheck", function (value) {
    	if(value.substr(0,5) != "ROLE_") return false;
    	else return  (/^([A-Z]+_*){1,}$/).test(value.substring(5));        
    },'角色名称格式错误'); /^[-]?(\d|([1-9]\d)|(1[0-7]\d)|(180))(\.\d*)?$/g
    
	/**
     * 经度验证
     */
    $.validator.addMethod("longitude", function (value) {
    	return  (/^[-]?(\d|([1-9]\d)|(1[0-7]\d)|(180))(\.\d*)?$/g).test(value);        
    },'经度格式错误');
    
    /**
     * 纬度验证
     */
    $.validator.addMethod("latitude", function (value) {
    	return  ( /^[-]?(\d|([1-8]\d)|(90))(\.\d*)?$/g).test(value);        
    },'纬度格式错误');
    
    /**
     * 车架号/发动机号重复性验证
     */
    $.validator.addMethod("only", function (value,element,param) {
    	var turn=false;
    	$.ajax({
    		type : "POST",
    		url : $('#checkUrl').val() + ".json",
    		dataType : "json",
    		data : {"param":value,"type":param,"id":$('#id').val()},
    		async : false,
    		success : function(response) {
    			if (response.status=='1') {
    				turn=true;
    			} 
    		},
    		error : function(XMLHttpRequest, textStatus, errorThrown) {
    		}
    	}); return turn;       
    },'数据重复');
});
