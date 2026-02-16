@Functions

	' lookup
	Public Shared lookup As crlookup(Of crConnection)
End Functions
@Code

	' Header
	ewr_Header(False)

	' Create page object
	If lookup Is Nothing Then
		lookup = New crlookup(Of crConnection)()
	End If
	CurrentPage = lookup

	' Page main
	CurrentPage.Page_Main()
End Code
