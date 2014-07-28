package com.shephertz.file.storage
{
	import com.shephertz.app42.paas.sdk.as3.App42CallBack;
	import com.shephertz.app42.paas.sdk.as3.App42Exception;
	import com.shephertz.app42.paas.sdk.as3.upload.Upload;
	import com.shephertz.app42.paas.sdk.as3.upload.UploadFile;
	
	public class App42ServicesCallBack implements App42CallBack
	{
		public function onException(excption:App42Exception):void  
		{  
			Constant.FileUpload = true
			Constant.FileUploadProgess = false
			Constant.exceptionMessage = excption.getMessage()
			
		} public function onSuccess(response:Object):void 
		{  
			var jsonObject:Object = new Object();
			if(Constant.responseArray){
				if(response is Upload){
					var upload:Upload = Upload(response);
					if(upload.getFileList()!= null)
					{
						var fileList:Array  = upload.getFileList();				
						Constant.FileCount =  fileList.length
					}
				}
				Constant.FileFetchProgess = false
			}
			else{
				if(response is Upload){				
					var upload1:Upload = Upload(response);
					if(upload1.getFileList()!= null)
					{
						var fileList1:Array  = upload1.getFileList();				
						for(var l:int=0;l<fileList1.length;l++)
						{
							var file1:UploadFile=UploadFile(fileList1[l]);
							Constant.FileUpload = true
						}
					}
				}
			}
		}
	}
}
