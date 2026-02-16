@Code

	' Header
	ewr_Header(False)

	' Create page object
	If rewbv Is Nothing Then
		rewbv = New crrewbv()
	End If
	CurrentPage = rewbv

	' Page main
	CurrentPage.Page_Main()
End Code
