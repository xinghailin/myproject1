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
                target: 'J_Pagination'+options.tab,
                pageSize: 10
            },
            settings = $.extend(defaultSettings, options);
        window.pagination = {
            _totalCount : settings.totalCount,
            _totalPage : Math.ceil(Number(settings.totalCount) / settings.pageSize) || 0, //总页数
            _initPageNo : (Math.ceil(Number(settings.totalCount) / settings.pageSize) || 0) === 0 ? 0 : 1
        };
        var _target = $('#' + settings.target),
        _curPage = $("<span id=\"J_CurPageNo"+settings.tab+"\">"+window.pagination._initPageNo+"</span>"),//当前页
            _first = $("<a href='javascript:void(0)' title=\"首页\" id=\"J_First"+settings.tab+"\">首页</a>"),//首页
            _prev = $("<a href='javascript:void(0)' title=\"上一页\" id=\"J_Prev"+settings.tab+"\">上一页</a>"),//上一页
            _next = $("<a href='javascript:void(0)' title=\"下一页\" id=\"J_Next"+settings.tab+"\">下一页</a>"),//下一页
            _last = $("<a href='javascript:void(0)' title=\"尾页\" id=\"J_Last"+settings.tab+"\">尾页</a></p>"),//尾页
            PAGINATION_HTML = "<p class=\"pagelink\">" +
            "共<span id=\"J_TotalCount\">" + window.pagination._totalCount + "</span>条，" +
            "第"+ _curPage.get(0).outerHTML + "/<label id=\"J_TotalPage\">" + window.pagination._totalPage + "</label>页&nbsp;&nbsp;" +
            _first.get(0).outerHTML+"&nbsp;&nbsp;" +
            _prev.get(0).outerHTML +"&nbsp;&nbsp;"+
            _next.get(0).outerHTML +"&nbsp;&nbsp;"+
            _last.get(0).outerHTML +
            "</p>&nbsp;&nbsp;";

        _target.on('click', 'a', function (e) {
            var _id = this.id,
                _curPageNo = Number($('#J_CurPageNo'+settings.tab).text());
            if (_id === 'J_First'+settings.tab) {//首页点击事件
                _curPageNo = 1;
            } else if (_id === 'J_Last'+settings.tab) {//尾页点击事件
                _curPageNo = window.pagination._totalPage;
            } else if (_id === 'J_Prev'+settings.tab) {//上一页点击事件
                _curPageNo = _curPageNo <= 1 ? 1 : _curPageNo - 1;
            } else if (_id === 'J_Next'+settings.tab) {//下一页点击事件
                _curPageNo = _curPageNo >= window.pagination._totalPage ? window.pagination._totalPage : _curPageNo + 1;
            }
            settings.load(_curPageNo,settings.pageSize,settings.tab);
            window.scrollTo(0,document.body.scrollHeight);  
            window.scrollTo(0,0);
            
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