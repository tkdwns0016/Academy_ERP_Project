<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>
	<table width="480" border="0" cellpadding="0" cellspacing="0">
		<tbody>
			<tr>
				<td height="40" bgcolor="#1A60A8">&nbsp;<font color="#FFFFFF"><b>▒
							거래처 검색</b></font></td>
			</tr>
			<tr>
				<td height="10"></td>
			</tr>
		</tbody>
	</table>
	<table border="0" width="480">
		<tbody>
			<tr>
				<td width="460">
					<table width="90%" border="0" cellspacing="0" cellpadding="1">
						<tbody>
							<tr>
								<td><font color="#666666"><span
										style="FONT-SIZE: 9pt"> <font color="#000000">찾고자하는
												거래처를 입력하신후 검색버튼을 클릭해 주세요</font></span></font></td>
							</tr>
						</tbody>
					</table> <br>
						<form action="/accountSearch" method="post">
				<table border="0" cellpadding="1" cellspacing="1" width="100%">
						<tbody>
							<tr>
								<td width="18%" bgcolor="#FFFFFF" class="td-account">거래처명:&nbsp;</td>
								<td width="82%" bgcolor="#FFFFFF"><input name="search"
									size="20" value="">&nbsp;<input type="submit"
									value="검색"  style="CURSOR: hand"></td>
							</tr>

						</tbody>
					</table>
						</form>
					<table align="center" border="0" width="100%">
						<tbody>
							<tr>
								<td height="10" colspan="6"></td>
							</tr>
							<tr height="25">
								<td colspan="4"><font color="#FF8200" size="2" colspan="6"><b>검색결과</b></font></td>
								<td align="right"><a
									href="javascript:rtv_account('new','','','','','','','','','','');"></td>
							</tr>
							<tr>
								<td height="3" bgcolor="#CCCCCC" colspan="6"></td>
							</tr>
							<tr>
								<td height="1" colspan="6"></td>
							</tr>
							<tr>
								<td height="10" colspan="6"></td>
							</tr>
							<tr bgcolor="#848284">
								<td height="1" colspan="5"></td>
							</tr>
							<tr bgcolor="#ececec" class="TEXT1">
								<td width="30%" height="25" align="center"
									style="font-size: 14px;"><b>거래처명</b></td>
								<td width="20%" height="25" align="center"
									style="font-size: 14px;"><b>거래처코드</b></td>
								<td width="20%" height="25" align="center"
									style="font-size: 14px;"><b>사업자번호</b></td>
								<td width="15%" height="25" align="center"
									style="font-size: 14px;"><b>대표자명</b></td>
								<td width="15%" height="25" align="center"
									style="font-size: 14px;"><b>지역</b></td>
							</tr>
							<tr bgcolor="#848284">
								<td height="1" colspan="5"></td>
							</tr>
						</tbody>
					</table>
				</td>
			</tr>
		</tbody>
	</table>
	<script>
		function sendChildValue(account) {

			opener.setAccountValue(account);

			window.close();
		}
	</script>
</body>
</html>