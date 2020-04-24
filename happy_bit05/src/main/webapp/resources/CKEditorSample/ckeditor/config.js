/**
 * @license Copyright (c) 2003-2019, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see https://ckeditor.com/legal/ckeditor-oss-license
 */
	CKEDITOR.editorConfig = function( config ) {
		
		// Define changes to default configuration here.
		// For complete reference see:
		// https://ckeditor.com/docs/ckeditor4/latest/api/CKEDITOR_config.html

		// The toolbar groups arrangement, optimized for two toolbar rows.

		
		config.extraPlugins = 'youtube';// youtube 플러그인
		config.skin = 'icy_orange';
		
		
		config.language = 'ko';
		config.width = 800;
		config.height = 500;
		config.resize_enabled = false;  //  false로 상태 변경
		
		
		config.enterMode = CKEDITOR.ENTER_BR;

		config.basicEntities = false;

		config.entities_greek = false; 

		config.entities_latin = false; 

		config.entities_additional = '';

		config.fillEmptyBlocks = false;

		config.autoparagraph = false


		

		
		// Remove some buttons provided by the standard plugins, which are
		// not needed in the Standard(s) toolbar.
		config.removeButtons = 'Underline,Subscript,Superscript';

		// Set the most common block elements.
		config.format_tags = 'p;h1;h2;h3;pre';

		// Simplify the dialog windows.
		config.removeDialogTabs = 'image:advanced;link:advanced';
		
	    config.filebrowserBrowseUrl = "/ckfinder/ckfinder.html";
	    config.filebrowserFlashBrowseUrl = "/ckfinder.html?type=Flash";
	    config.filebrowserUploadUrl = "/ckfinder/core/connector/java/connctor.java?command=QuickUpload&type=Files";
	    config.filebrowserImageUploadUrl = "/ckfinder/core/connector/java/connector.java?command=QuickUpload&type=Images";
	    config.filebrowserFlashUploadUrl = "/ckfinder/core/connector/java/connector.java?command=QuickUpload&type=Flash";	
	};

