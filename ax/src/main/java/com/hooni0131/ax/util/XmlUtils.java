package com.hooni0131.ax.util;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Collection;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import org.jdom2.Document;
import org.jdom2.Element;
import org.jdom2.output.Format;
import org.jdom2.output.Format.TextMode;
import org.jdom2.output.XMLOutputter;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.google.common.collect.Lists;

public class XmlUtils {

	private static final Logger logger = LoggerFactory.getLogger(XmlUtils.class);
	
	/**
	 * 데이터를 XML파일로 생성하기
	 * @param params
	 * @param rootElementName
	 */
	public static void makeXmlFile(List<HashMap<String, Object>> params, String rootElementName) {
		
		if( "".equals(rootElementName)) {
			rootElementName = "ROOT_LIST";
		}

		String elementName = rootElementName;

		XMLOutputter xmlOutter = null;
		Document xRoot = new Document();
		Element xRows = new Element(rootElementName+"_LIST");

		for(HashMap<String, Object> map: params) {
			
			try {
				
				// HashMap의 key값을 조회 한다.
				List<String> ids = Lists.newArrayList();
				Set ks = map.keySet();
				Iterator itor = ks.iterator();
				
				while(itor.hasNext()) {
					ids.add(String.valueOf(itor.next()));
				}
				// 노드 정렬
				Collections.sort(ids);
				
				// HashMap의 key값을 조회 한다.
				Element element = null;
				int cnt = 0;
				for( String id: ids) {

					if( cnt == 0 ) {
						element = new Element(elementName);
						// DB 컬럼에 숫자로 Alias를 주어 정렬 처리하고 XML 노드명에선 제거(id.substring(2, id.length())
						element.setAttribute(id.substring(2, id.length()), (String)map.get(id)); // node 속성으로 등록
					} else {				
						Element xName = new Element(id.substring(2, id.length()));
						xName.setText((String)map.get(id)); // node의 Data로 등록
						// 상위 Node에 등록
						element.addContent(xName);
					}
					cnt++;
				}				
				// 최 상위 노드에 등록
				xRows.addContent(element);
				
			} catch (Exception e) {
				e.printStackTrace();
				logger.error(e.getMessage());
			}
		}
		
		xRoot.addContent(xRows);
		
		//jdom format
		Format format = Format.getPrettyFormat();
		format.setEncoding("UTF-8");
		format.setTextMode(TextMode.TRIM);
		xmlOutter = new XMLOutputter(format);
		
		String filePath = "C:\\";
		String fileName = "xmlList.xml";
		File file = null;
		
		try {
			
			file = new File(filePath + fileName);
			if( !file.exists()) {
				file.createNewFile();
			}
			
			xmlOutter.output(xRoot, new FileOutputStream(file));
			
		} catch (IOException e) {
			logger.error(e.getMessage());
			e.printStackTrace();
		} catch (Exception e) {
			logger.error(e.getMessage());
			e.printStackTrace();
		}
	}
}
