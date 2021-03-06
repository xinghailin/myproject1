/**
 * @fileOverview 邮政分页控件
 * @version 1.0.0
 */
define(function (require, exports) {
    'use strict';
    /**
     * 分页控件初始化方法
     * @param options 用户传入参数
     *  target [string] : 生成分页控件的id或jquery对象，默认id为J_Pagination
     *  pageSize[number] : 每页显示条数，默认10条(require)
     *  totalCount[number] : 总条数(require)
     *  load[function] : 请求后台方法(require)
     * @private
     */
    function _init(options) {
        var defaultSettings = {
                target: 'J_Pagination',
                pageSize: 10
            },
            settings = $.extend(defaultSettings, options);
        window.pagination = {
            _totalCount : settings.totalCount,
            _totalPage : Math.ceil(Number(settings.totalCount) / settings.pageSize) || 0, //总页数
            _initPageNo : (Math.ceil(Number(settings.totalCount) / settings.pageSize) || 0) === 0 ? 0 : 1
        };
        var _target = $('#' + settings.target),
        _curPage = $("<label id=\"J_CurPageNo\">"+window.pagination._initPageNo+"</label>"),//当前页
        _first = $("<a href='#' title=\"首页\" id=\"J_First\">首页</a>"),//首页
        _prev = $("<a href='#' title=\"上一页\" id=\"J_Prev\">上一页</a>"),//上一页
        _next = $("<a href='#' title=\"下一页\" id=\"J_Next\">下一页</a>"),//下一页
        _last = $("<a href='#' title=\"尾页\" id=\"J_Last\">尾页</a>"),//尾页
        _jump = "跳转  第<input id='J_input' style='border: 1px solid #e4e4e4' type='text' size='3' />&nbsp;页  <a id='J_Go' href='#'>GO</a></p>",//跳转
        PAGINATION_HTML = "<p class=\"pagelink\">" +
            "共<span id=\"J_TotalCount\">" + window.pagination._totalCount + "</span>条，" +
            "第"+ _curPage.get(0).outerHTML + "/<label id=\"J_TotalPage\">" + window.pagination._totalPage + "</label>页&nbsp;&nbsp;" +
            _first.get(0).outerHTML+"&nbsp;&nbsp;" +
            _prev.get(0).outerHTML +"&nbsp;&nbsp;"+
            _next.get(0).outerHTML +"&nbsp;&nbsp;"+
            _last.get(0).outerHTML +"&nbsp;&nbsp;"+
            _jump +
            "</p>&nbsp;&nbsp;";
    
    $("#J_Pagination").delegate("input[id='J_input']","keyup",function(){ //keyup事件处理 
    	$(this).val($(this).val().replace(/\D|^0/g,''));
    }).delegate("input[id='J_input']","paste",function(){ //CTR+V事件处理 
    	$(this).val($(this).val().replace(/\D|^0/g,''));
    }).css("ime-mode", "disabled"); //CSS设置输入法不可用

    _target.on('click', 'a', function (e) {
        var _id = this.id,
            _curPageNo = Number($('#J_CurPageNo').text());
        if (_id === 'J_First') {//首页点击事件
            _curPageNo = 1;
        } else if (_id === 'J_Last') {//尾页点击事件
            _curPageNo = window.pagination._totalPage;
        } else if (_id === 'J_Prev') {//上一页点击事件
            _curPageNo = _curPageNo <= 1 ? 1 : _curPageNo - 1;
        } else if (_id === 'J_Next') {//下一页点击事件
            _curPageNo = _curPageNo >= window.pagination._totalPage ? window.pagination._totalPage : _curPageNo + 1;
        } else if (_id === 'J_Go') {//跳转点击事件
        	if($('#J_input').val() != "" && $('#J_input').val().length > 0){
        		_curPageNo = Number($('#J_input').val());
        	}else{
        		_curPageNo = 1;
        	}
        	
        	_curPageNo = _curPageNo >= window.pagination._totalPage ? window.pagination._totalPage : _curPageNo;
        }
        settings.load(_curPageNo,settings.pageSize);
        e.preventDefault();
        e.stopPropagation();
    });

        //渲染html
        _target.html(PAGINATION_HTML);
    }

    exports.init = _init;

    /**
     *  返回更新后的当前页
     * @param _totalCount
     * @param pageSize
     * @return {number}
     */
    exports.changePage = function(_totalCount, pageSize){
        window.pagination._totalPage =  Math.ceil(_totalCount/pageSize);
        //return  _totalCount===0? 0 : 1;
    };
});