
/**********************************************************************************************************************
	CMS동기화때 발생되는 
	ERROR [Thread-71] [172.168.112.147] (00007NGT) [CatalogVersionSyncJob] Cannot use target catalog version handsomeContentCatalog/Online(8796093284953) for synchronization since it owns 1 duplicate CMSItem IDs
	에러 처리 방법;
 **********************************************************************************************************************/    
	/** 1) 아래 쿼리 실행하면 count 가 1이상인 컴포넌트가 존재 하여 위와 같은 에러가 발생 한다. **/
	SELECT A.P_UID, COUNT(A.P_UID) FROM (
		  SELECT * FROM CMSCOMPONENT 
		   WHERE P_CATALOGVERSION = '8796093284953'
             AND LEFT(CREATEDTS, 10) = '2018-04-03') AS A
  GROUP BY A.P_UID;
             
	/** 2) 중복되는 컴포넌트 PK 조회하여 삭제 **/
   SELECT * FROM CMSCOMPONENT WHERE P_UID = 'comp_000015O0';
	DELETE FROM CMSCOMPONENT WHERE PK IN ('8798223041596');
   
   

   COMMIT;
    
    SELECT * FROM USERS;

	SELECT * fROM pagetemplate ORDER BY CREATEDTS DESC;

SELECT COUNT(P_UID) as cnt, P_UID , p_label FROM (
SELECT t3.*
  FROM CATALOGS T1,
	    CATALOGVERSIONS T2,
	    CMSPAGE T3
WHERE T2.PK = '8796093284953' 
  AND T1.P_ACTIVECATALOGVERSION = T2.PK
  AND T1.P_ACTIVECATALOGVERSION = T3.P_CATALOGVERSION) TB GROUP BY P_UID, p_label
  having cnt > 1;
  
  
  
SELECT COUNT(P_UID) as cnt, P_UID ,  p_frontendtemplatename FROM (
SELECT t3.*
  FROM CATALOGS T1,
	    CATALOGVERSIONS T2,
	    pagetemplate T3
WHERE T2.PK = '8796093284953' 
  AND T1.P_ACTIVECATALOGVERSION = T2.PK
  AND T1.P_ACTIVECATALOGVERSION = T3.P_CATALOGVERSION) TB GROUP BY P_UID, p_frontendtemplatename
  having cnt > 1
  
  
  
SELECT COUNT(P_UID) as cnt , P_UID FROM (
SELECT t3.*
  FROM CATALOGS T1,
	    CATALOGVERSIONS T2,
	    contentslot T3
WHERE T2.PK = '8796093284953' 
  AND T1.P_ACTIVECATALOGVERSION = T2.PK
  AND T1.P_ACTIVECATALOGVERSION = T3.P_CATALOGVERSION) TB GROUP BY P_UID
  having cnt > 1

/**
	중복 데이터가 있을 경우 데이터 확인하여 삭제 **/
SELECT * FROM CONTENTSLOT WHERE P_UID='Section1Slot-br08Page2017';

DELETE FROM CONTENTSLOT WHERE PK in( '8796421129258'; 


/** 증복 허용 */
SELECT COUNT(P_NAME) AS CNT, P_NAME FROM (
SELECT T2.* 
  FROM PAGETEMPLATE T1,
       CONTENTSLOTNAME T2
 WHERE T1.PK = T2.P_TEMPLATE) T GROUP BY P_NAME;
   
/**
	등록된 슬롯 확인하기 **/
SELECT *
  FROM CONTENTSLOTNAME 
 WHERE P_NAME = 'Section4'
--   AND LEFT(CREATEDTS, 10) = '2017-12-01';
ORDER BY CREATEDTS DESC, MODIFIEDTS DESC
   
select * from ContentSlotName where p_template = ( select p_mastertemplate from CMSPAGE WHERE P_UID='br01Page2017')   

select * from CMSPAGE WHERE P_UID='br01Page2017'
   
/** 슬롯과 매핑된 템플릿 데이터 조회 */   
SELECT *
  FROM SLOTSFORTEMPLATE
 WHERE P_PAGETEMPLATE = (SELECT DISTINCT P_TEMPLATE FROM CONTENTSLOTNAME WHERE P_TEMPLATE = (
	select p_mastertemplate from CMSPAGE WHERE P_UID='br01Page2017')
	)



SELECT P_COMPTYPEGROUP, P_TEMPLATE
  FROM CONTENTSLOTNAME 
 WHERE P_NAME = 'SiteLogo'
 GROUP BY P_COMPTYPEGROUP, P_TEMPLATE
   

  
SELECT COUNT(P_UID) as cnt, P_UID FROM (
SELECT t3.*
  FROM CATALOGS T1,
	    CATALOGVERSIONS T2,
	    cmscomponent T3
WHERE T2.PK = '8796093284953' 
  AND T1.P_ACTIVECATALOGVERSION = T2.PK
  AND T1.P_ACTIVECATALOGVERSION = T3.P_CATALOGVERSION) TB GROUP BY P_UID
  having cnt > 1;

/** 등록된 컴포넌트 조회 */
SELECT COUNT(P_UID) COUNT, P_UID, P_NAME FROM CMSCOMPONENT GROUP BY P_UID, P_NAME ;


SELECT * FROM CMSCOMPONENT WHERE P_UID = 'br01PageHandsomeBrandTextComponent01_2017' AND P_CATALOGVERSION != '8796093252185'

delete from cmscomponent where p_uid = 'br01PageHandsomeImageComponent2017';
DELETE FROM CMSCOMPONENT WHERE PK ='8796454257724'
COMMIT;



/** 중복 데이터 확인 **/

SELECT * FROM CMSCOMPONENT WHERE P_UID IN(
'handsomeMainExhibitionEditorialBannerComponent201708_2',
'handsomeMainMiddleBannerComponent201708') ORDER BY P_UID

/** 중복데이터 삭제 **/
DELETE FROM CMSCOMPONENT WHERE PK IN(
 '8796453798972',
 '8796454093884',
 '8796453733436',
 '8796453962812');


COMMIT;


/** 템플릿을 사용하는 슬롯 조회하기 ( 중복허용 )*/  
SELECT COUNT(P_NAME) AS CNT, P_NAME FROM (
SELECT T2.* 
  FROM PAGETEMPLATE T1,
       CONTENTSLOTNAME T2
 WHERE T1.PK = T2.P_TEMPLATE) T GROUP BY P_NAME;
 
 
 
/**
	슬롯별 동기화 로그}(cms에서 동기화 진행할때마다 Row 데이터 추가됨) **/	    
SELECT *
  FROM ITEMSYNCTIMESTAMPS 
 WHERE P_SOURCEITEM IN( 
  SELECT pk
  FROM CONTENTSLOT WHERE P_UID LIKE '%Page2017'
  );
  
COMMIT;


SELECT *
  FROM ITEMSYNCTIMESTAMPS 
 WHERE P_SOURCEITEM IN( 
  SELECT pk
  FROM CONTENTSLOT WHERE P_UID LIKE '%2016%'
  );
  
  


 SELECT PK
  FROM ITEMSYNCTIMESTAMPS 
 WHERE P_SOURCEITEM IN( 
  SELECT pk
  FROM CONTENTSLOT WHERE P_UID LIKE '%2016%'
  )

COMMIT;
 
 DELETE FROM ITEMSYNCTIMESTAMPS WHERE
 PK IN(
 '8802812199531',
 '8802812330603',
 '8802811511403',
 '8802811544171',
 '8802811970155',
 '8802811380331',
 '8802811904619',
 '8802811609707',
 '8802811445867',
 '8802811773547',
 '8802812035691' 
)
  
  
SELECT *
  FROM CONTENTSLOT WHERE P_UID LIKE '%Page2017'


/** 확인중 .. **/

SELECT COUNT(P_UID) AS CNT , P_UID, P_CATALOGVERSION  FROM CMSCOMPONENT GROUP BY P_UID, P_CATALOGVERSION;
ORDER BY P_UID

SELECT COUNT(P_UID), P_UID FROM CMSCOMPONENT GROUP BY P_UID
HAVING P_UID='HandsomeMainTopLineBannerComponent';


select * from pagetemplate where p_uid='BrandSubMainPage2017Template';


SELECT * FROM CMSPAGE WHERE P_UID='br01Page2017';


select * from ContentSlotName where p_template = (
select p_mastertemplate from CMSPAGE WHERE P_UID='br01Page2017')


select * from Slotsfortemplate where p_pagetemplate = ( select distinct p_template from ContentSlotName where p_template = (
select p_mastertemplate from CMSPAGE WHERE P_UID='br01Page2017'))





select * from ContentSlot  order by modifiedTS desc, p_uid asc;

select a.p_uid, count(a.p_uid) from (
select * from cmscomponent where p_catalogversion = '8796093284953'
and left(createdTS, 10) = '2018-02-13') a group by a.p_uid;

select * from cmscomponent where p_catalogversion = '8796093284953'
and left(createdTS, 10) = '2018-02-13';

/** cmscomponent에서 p_uid 가 중복되는 데이터 삭제 **/
delete from cmscomponent where pk = '8798223336508';

select pk, count(pk) from cmscomponent a
where p_catalogversion = '8796093284953'
group by pk
order by createdTS desc;

delete from cmscom


SELECT *
  FROM CMSPAGE  
 WHERE P_UID='br01Page2017';
 
 
 select * from cmscomponent where p_uid='brandSubMainPage2017Template';
 
 

select * from ContentSlot  order by modifiedTS desc, p_uid asc;
 
 
 8796093252185
 
 select * 
   from slotsforpage where p_contentslot in
   (
   '8796322497578'
  ,'8796322432042'
  ,'8796322464810')
  
  
SELECT * 
  FROM PageTemplate ORDER BY MODIFIEDTS DESC;
  
  
  SELECT *
    FROM CATALOGVERSIONSYNCJOB;
    
SELECT *
  FROM ITEMSYNCTIMESTAMPS ORDER BY CREATEDTS DESC;