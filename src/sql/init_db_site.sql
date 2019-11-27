
-- override default accounts
TRUNCATE TABLE core_admin_user;
INSERT INTO core_admin_user VALUES (1,'admin','Admin','admin','admin@lutece.fr',0,'PLAINTEXT:suggest','en',0,0,0,'2020-01-01 00:00:00',null,0,'1980-01-01 00:00:00','all');


-- override site properties
REPLACE INTO core_datastore VALUES ('portal.site.site_property.name', 'Suggest Demo Site');
REPLACE INTO core_datastore VALUES ('portal.site.site_property.meta.author', 'suggest team');
REPLACE INTO core_datastore VALUES ('portal.site.site_property.locale.default', 'en');
REPLACE INTO core_datastore VALUES ('portal.site.site_property.meta.copyright', 'Copyright &copyright; City of Paris');
REPLACE INTO core_datastore VALUES ('portal.site.site_property.meta.description', '<description>');
REPLACE INTO core_datastore VALUES ('portal.site.site_property.meta.keywords', '<keywords>');
REPLACE INTO core_datastore VALUES ('portal.site.site_property.email', 'lutece-dev@paris.fr');
REPLACE INTO core_datastore VALUES ('portal.site.site_property.noreply_email', 'no-reply@paris.fr');
REPLACE INTO core_datastore VALUES ('portal.site.site_property.home_url', 'jsp/site/Portal.jsp?page=suggest');
REPLACE INTO core_datastore VALUES ('portal.site.site_property.back_images', '\'images/admin/skin/bg_images1.jpg\',  \'images/admin/skin/bg_images2.jpg\' , \'images/admin/skin/bg_images3.jpg\'');

-- override plugin status
REPLACE INTO core_datastore VALUES ('core.plugins.status.html.installed' ,'truel' );
REPLACE INTO core_datastore VALUES ('core.plugins.status.html.pool' ,'portal' );
REPLACE INTO core_datastore VALUES ('core.plugins.status.suggest.installed' ,'true' );
REPLACE INTO core_datastore VALUES ('core.plugins.status.suggest.pool' ,'portal' );
REPLACE INTO core_datastore VALUES ('core.plugins.status.seo.installed' ,'true' );
REPLACE INTO core_datastore VALUES ('core.plugins.status.seo.pool' ,'portal' );
REPLACE INTO core_datastore VALUES ('core.plugins.status.avatar.installed' ,'true' );
REPLACE INTO core_datastore VALUES ('core.plugins.status.systeminfo.installed' ,'portal' );
REPLACE INTO core_datastore VALUES ('core.plugins.status.theme.installed' ,'true' );
REPLACE INTO core_datastore VALUES ('core.plugins.status.theme.pool' ,'portal' );

 
