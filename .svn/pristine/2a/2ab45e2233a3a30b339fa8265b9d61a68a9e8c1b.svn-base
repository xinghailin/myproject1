define(function (require, exports) {
    'use strict';
    require('datepicker')($);
    var moment = require('moment'),
        S_DATE_FORMAT = 'YYYY-MM-DD';

    /**
     * @description 获取某日期3个月前的第一天
     * 比如：7月25日调用这个方法获得结果：4月1日
     * @param months
     * @return {*}
     * @private
     * @param currentDate
     */
    function _getPreviousDateByMonth(months, currentDate){
        var firstDayOfThisMonth = moment(currentDate, S_DATE_FORMAT).date(1);
        return firstDayOfThisMonth.subtract('months', months).toDate(); //获取前若干月份的date
    }

    function _getDay(currentDate){
        var firstDayOfThisMonth = moment(currentDate, S_DATE_FORMAT);
        return firstDayOfThisMonth.toDate(); //获取当前date
    }
    exports.getDay = _getDay;
    exports.getPreviousDateByMonth = _getPreviousDateByMonth;
    exports.datesTrigger = function(startSelector, endSelector, minDate){
        //营业执照成立日期和营业期限联动
        $(startSelector).datepicker({
            minDate: minDate||null,
            onSelect:function(date){   //选择后触发函数
                date = new Date($(this).val().replace(/-/g,'/'));
                //moment(date).add('d', 1).toDate(); //获取往后一天的date
                $(endSelector).datepicker('option', 'minDate', date); //设置结束日期最小可选日期
            }
        });
        $(endSelector).datepicker({
            minDate: minDate||null,
            onSelect:function(date){
                date = new Date(date.replace(/-/g,'/'));
                //moment(date).subtract('d', 1).toDate(); //获取前一天的date
                $(startSelector).datepicker('option', 'maxDate', date); //设置开始日期最大可选日期
            }
        });
    };
    exports.datesTriggerSimple = function(startSelector,minDate,maxDate){
    	if(minDate||maxDate){
    		$(startSelector).datepicker({
                minDate: minDate||null,maxDate: maxDate||null,
            });
    	}
    	else $(startSelector).datepicker();
    };
});
