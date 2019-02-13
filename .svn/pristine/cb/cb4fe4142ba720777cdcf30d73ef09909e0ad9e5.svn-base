<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*"%>
<%@ include file="/WEB-INF/views/base/base.jsp"%>
<link href="${cssBasePath}/common/default.css" rel="stylesheet">
<link href="${cssBasePath}/bootstrap.min.css" rel="stylesheet" >
<input type="hidden" id="searchUrl" value="<ufa:url fieldName="SAVE_PROCUREMENTWEEKLY" namespace="car-ms"/>">
<input type="hidden" id="findListMaxDateUrl" value="<ufa:url fieldName="FINLISTMAXDATE_PROCUREMENTWEEKLY" namespace="car-ms"/>">


<style>
    @media (min-width: 1330px) {
        .container {
            width: 1300px;
        }
    }

    .box {
        /*width: 1524px;*/
        overflow: hidden;
        color: #555;
        margin-left: 50px;
    }

    .newInput {
        padding: 10px 15px;
    }

    .newInput label {
        font-weight: normal;
    }

    .du-btn {
        text-align: center;
        margin: 50px 0;
    }

    .du-btn a {
        margin: 0 30px;
    }
    #du-table tr th, #du-table tr td {
        text-align: center;
    }

    #du-table tr th {
        padding: 20px 5px;
    }
    #du-table tr td{
        max-width: 100px;
        height: auto;
        word-wrap:break-word;
    }
    .adds{
        margin: 0 auto;
        display: block;
    }
</style>





<div class="box">
    <div class="container">
        <div class="table-responsive">
			<ul class="tb_ul02">
				<li>

					<div class="form-inline">
						<div class="form-group newInput">
							<label>报价名称：</label> <input class="input_text01" name="quoteName"
								id="quoteName" class="input_text01" type="text"
								style="width: 180px;">
						</div>
						<div class="form-group newInput">
							<label>报价日期：</label> <input class="input_text01" name="quoteDate"
								id="payDateTime" class="input_text01" type="text"
								style="width: 180px;">
						</div>
					</div>
				</li>
			</ul>
			<table class="table table-bordered table-striped table-hover" id="du-table">
                <thead>
                <tr>
                    <th v="brand">品牌</th>
                    <th v="carModel">车型</th>
                    <th v="version">版本</th>
                    <th v="configure">配置</th>
                    <th v="colour">颜色</th>
                    <th v="number">数量</th>
                    <th v="type">类型</th>
                    <th v="settlementPrice">结算价</th>
                    <th v="marketPrice">行情价</th>
                    <th v="operate">操作</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td class="aa">
                        <button type="button" class="btn btn-danger btn-sm aa del">删除</button>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td class="aa">
                        <button type="button" class="btn btn-danger btn-sm aa del">删除</button>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td class="aa">
                        <button type="button" class="btn btn-danger btn-sm aa del">删除</button>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td class="aa">
                        <button type="button" class="btn btn-danger btn-sm aa del">删除</button>
                    </td>
                </tr>
                </tbody>
            </table>
            

						
            <button type="button" class="btn btn-warning btn-sm adds" style="padding: 6px 28px"><span class="glyphicon glyphicon-plus"></span>添加</button>
        </div>
        <div class="du-btn">
            <a href="javascript:;" class="btn btn-primary submit" role="button" style="padding: 6px 38px">提交     </a>
            <a href="javascript:;" class="btn btn-primary" role="button" style="padding: 6px 38px">  取消         </a>
            <a id='backBtn' href="javascript:void(0);" class="btn btn-primary" role="button" style="padding: 6px 38px">  返回         </a>
        </div>
    </div>
</div>
</body>
<!-- <script src="js/jquery-2.1.4.min.js"></script> -->

<script type="text/javascript">
    seajs.use("${scriptBasePath}/procurementWeeklyQuotation/add.js?r=<%=new Date()%>");
</script>