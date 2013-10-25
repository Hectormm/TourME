<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="ClassLibrary2.index" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">

<html>
	<head>
		<title>Slide.Show</title>
		<script type="text/javascript" src="Silverlight.js"></script>
		<script type="text/javascript" src="SlideShow.js"></script>
	</head>
	<body>
		<script type="text/javascript">
		    new SlideShow.Control(new SlideShow.XmlConfigProvider());
		</script>
	</body>
</html>

    <a href="https://maps.google.com/maps/api/staticmap?center=91,91&amp;zoom=14&amp;size=400x400&amp;sensor=false">https://maps.google.com/maps/api/staticmap?center=91,91&zoom=14&size=400x400&sensor=false</a><br />
    <br />
    <img alt="" 
        src="https://maps.google.com/maps/api/staticmap?center=91,91&amp;zoom=14&amp;size=400x400&amp;sensor=false" /> 

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Footer" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="AfterBody" runat="server">
</asp:Content>
