%=======================================================================
% García Tello Axel
%
% Examen Parcial 1. Rutas en el Metro CDMX.
% Represente en Prolog la red completa del Metro de la CDMX y programar
% lo predicados necesarios para informar a un usuario sobre la mejor y
% peor ruta (en tiempo) entre dos estaciones cualesquiera.
%
% Considerando el grafo como dirigido y etiquetado, el tiempo asociado
% a cada arista se calcula como (5 min)* el grado de la estación destino
% mas (10 min) por cada transbordo entre líneas.
%
% Predicados relevantes:
%   ruta(<estación 1>, <estación 2>, <ruta>, <costo>).
%   calcula_rutas(<estación 1>, <estación 2>, <lista>).
%   mejor_ruta(<estación 1>, <estación 2>, <ruta>, <costo>).
%   mejores_rutas(<estación 1>, <estación 2>, <lista>).
%   peor_ruta(<estación 1>, <estación 2>, <ruta>, <costo>).
%   peores_rutas(<estación 1>, <estación 2>, <lista>).
%   sistema_metro().
%========================================================================

%========================================================================
% Base del conocimiento.
%
% id/1.
%
% Líneas del metro existentes.
%========================================================================

id(1).
id(2).
id(3).
id(4).
id(5).
id(6).
id(7).
id(8).
id(9).
id(a).
id(b).
id(12).

%========================================================================
% color/2.
%
% Color distintivo de cada línea.
%========================================================================

color(1,rosa).
color(2,azul).
color(3,verde_oliva).
color(4,verde_azulado).
color(5,amarillo).
color(6,rojo).
color(7,naranja).
color(8,verde).
color(9,café).
color(a,morado).
color(b,verde_gris).
color(12,dorado).

%========================================================================
% terminal/2.
% Terminales de cada línea.
%========================================================================

terminal(1,observatorio).
terminal(1,pantitlán).
terminal(2,cuatro_caminos).
terminal(2,tasqueña).
terminal(3,universidad).
terminal(3,indios_verdes).
terminal(4,martín_carrera).
terminal(4,santa_anita).
terminal(5,pantitlán).
terminal(5,politécnico).
terminal(6,martín_carrera).
terminal(6,el_rosario).
terminal(7,el_rosario).
terminal(7,barranca_del_muerto).
terminal(8,garibaldi_lagunilla).
terminal(8,constitución_de_1917).
terminal(9,pantitlán).
terminal(9,tacubaya).
terminal(a,pantitlán).
terminal(a,la_paz).
terminal(b,ciudad_azteca).
terminal(b,buenavista).
terminal(12,mixcoac).
terminal(12,tláhuac).

%========================================================================
% estacion/2.
% Estaciones de cada línea.
%========================================================================

estacion(observatorio,1).
estacion(tacubaya,1).
estacion(juanacatlán,1).
estacion(chapultepec,1).
estacion(sevilla,1).
estacion(insurgentes,1).
estacion(cuauhtémoc,1).
estacion(balderas,1).
estacion(salto_del_agua,1).
estacion(isabel_la_católica,1).
estacion(pino_suárez,1).
estacion(merced,1).
estacion(candelaria,1).
estacion(san_lázaro,1).
estacion(moctezuma,1).
estacion(balbuena,1).
estacion(boulevard_puerto_aéreo,1).
estacion(gómez_farías,1).
estacion(zaragoza,1).
estacion(pantitlán,1).

estacion(cuatro_caminos,2).
estacion(panteones,2).
estacion(tacuba,2).
estacion(cuitláhuac,2).
estacion(popotla,2).
estacion(colegio_militar,2).
estacion(normal,2).
estacion(san_cosme,2).
estacion(revolución,2).
estacion(hidalgo,2).
estacion(bellas_artes,2).
estacion(allende,2).
estacion(zócalo,2).
estacion(pino_suárez,2).
estacion(san_antonio_abad,2).
estacion(chabacano,2).
estacion(viaducto,2).
estacion(xola,2).
estacion(villa_de_cortés,2).
estacion(nativitas,2).
estacion(portales,2).
estacion(ermita,2).
estacion(general_anaya,2).
estacion(tasqueña,2).

estacion(universidad,3).
estacion(copilco,3).
estacion(miguel_ángel_de_quevedo,3).
estacion(viveros_derechos_humanos,3).
estacion(coyoacán,3).
estacion(zapata,3).
estacion(división_del_norte,3).
estacion(eugenia,3).
estacion(etiopía_plaza_de_la_transparencia,3).
estacion(centro_medico,3).
estacion(hospital_general,3).
estacion(niños_héroes,3).
estacion(balderas,3).
estacion(juárez,3).
estacion(hidalgo,3).
estacion(guerrero,3).
estacion(tlatelolco,3).
estacion(la_raza,3).
estacion(potrero,3).
estacion(deportivo_18_de_marzo,3).
estacion(indios_verdes,3).

estacion(martín_carrera,4).
estacion(talismán,4).
estacion(bondojito,4).
estacion(consulado,4).
estacion(canal_del_norte,4).
estacion(morelos,4).
estacion(candelaria,4).
estacion(fray_servando,4).
estacion(jamaica,4).
estacion(santa_anita,4).

estacion(pantitlán,5).
estacion(hangares,5).
estacion(terminal_aérea,5).
estacion(oceanía,5).
estacion(aragón,5).
estacion(eduardo_molina,5).
estacion(consulado,5).
estacion(valle_gómez,5).
estacion(misterios,5).
estacion(la_raza,5).
estacion(autobuses_del_norte,5).
estacion(instituto_del_petróleo,5).
estacion(politécnico,5).

estacion(martín_carrera,6).
estacion(la_villa_basílica,6).
estacion(deportivo_18_de_marzo,6).
estacion(lindavista,6).
estacion(instituto_del_petróleo,6).
estacion(vallejo,6).
estacion(norte_45,6).
estacion(ferrería_arena_ciudad_de_méxico,6).
estacion(azcapotzalco,6).
estacion(tezozómoc,6).
estacion(el_rosario,6).

estacion(el_rosario,7).
estacion(aquiles_serdán,7).
estacion(camarones,7).
estacion(refinería,7).
estacion(tacuba,7).
estacion(san_joaquín,7).
estacion(polanco,7).
estacion(auditorio,7).
estacion(constituyentes,7).
estacion(tacubaya,7).
estacion(san_pedro_de_los_pinos,7).
estacion(san_antonio,7).
estacion(mixcoac,7).
estacion(barranca_del_muerto,7).

estacion(garibaldi_lagunilla,8).
estacion(bellas_artes,8).
estacion(san_juan_de_letrán,8).
estacion(salto_del_agua,8).
estacion(doctores,8).
estacion(obrera,8).
estacion(chabacano,8).
estacion(la_viga,8).
estacion(santa_anita,8).
estacion(coyuya,8).
estacion(iztacalco,8).
estacion(apatlaco,8).
estacion(aculco,8).
estacion(escuadrón_201,8).
estacion(atlililco,8).
estacion(iztapalapa,8).
estacion(cerro_de_la_estrella,8).
estacion(uam_i,8).
estacion(constitución_de_1917,8).

estacion(pantitlán,9).
estacion(puebla,9).
estacion(ciudad_deportiva,9).
estacion(velódromo,9).
estacion(mixiuhca,9).
estacion(jamaica,9).
estacion(chabacano,9).
estacion(lázaro_cárdenas,9).
estacion(centro_medico,9).
estacion(chilpancingo,9).
estacion(patriotismo,9).
estacion(tacubaya,9).

estacion(pantitlán,a).
estacion(agrícola_oriental,a).
estacion(canal_de_san_juan,a).
estacion(tepalcates,a).
estacion(guelatao,a).
estacion(peñón_viejo,a).
estacion(acatitla,a).
estacion(santa_marta,a).
estacion(los_reyes,a).
estacion(la_paz,a).

estacion(cuidad_azteca,b).
estacion(plaza_aragón,b).
estacion(olímpia,b).
estacion(ecatepec,b).
estacion(múzquiz,b).
estacion(rio_de_los_remedios,b).
estacion(impulsora,b).
estacion(nezahualcóyotl,b).
estacion(villa_de_aragón,b).
estacion(bosque_de_aragón,b).
estacion(deportivo_oceanía,b).
estacion(oceanía,b).
estacion(romero_rubio,b).
estacion(flores_magón,b).
estacion(san_lázaro,b).
estacion(morelos,b).
estacion(tepito,b).
estacion(lagunilla,b).
estacion(garibaldi_lagunilla,b).
estacion(guerrero,b).
estacion(buenavista,b).

estacion(mixcoac,12).
estacion(insurgentes_sur,12).
estacion(hospital_20_de_noviembre,12).
estacion(zapata,12).
estacion(parque_de_los_venados,12).
estacion(eje_central,12).
estacion(ermita,12).
estacion(mexicaltzingo,12).
estacion(atlalilco,12).
estacion(culhuacán,12).
estacion(san_andrés_tomatlán,12).
estacion(lomas_estrella,12).
estacion(calle_11,12).
estacion(periférico_oriente,12).
estacion(tezonco,12).
estacion(olivos,12).
estacion(nopalera,12).
estacion(zapotitlán,12).
estacion(tlaltenco,12).
estacion(tláhuac,12).

%========================================================================
% conecta/3.
%
% Conexiones entre estaciones.
% Los primeros dos parámetros representan las estaciones conectadas.
% El tercer parámetro indica el costo de la primera estación a la segunda
% estación.
% El costo fue calculado con las caracteristicas establecidas en la
% actividad.
%========================================================================

conecta(observatorio,tacubaya,25).
conecta(tacubaya,observatorio,5).
conecta(tacubaya,juanacatlán,10).
conecta(juanacatlán,tacubaya,25).
conecta(juanacatlán,chapultepec,10).
conecta(chapultepec,juanacatlán,10).
conecta(chapultepec,sevilla,10).
conecta(sevilla,chapultepec,10).
conecta(sevilla,insurgentes,10).
conecta(insurgentes,sevilla,10).
conecta(insurgentes,cuauhtémoc,10).
conecta(cuauhtémoc,insurgentes,10).
conecta(cuauhtémoc,balderas,20).
conecta(balderas,cuauhtémoc,10).
conecta(balderas,salto_del_agua,20).
conecta(salto_del_agua,balderas,20).
conecta(salto_del_agua,isabel_la_católica,10).
conecta(isabel_la_católica,salto_del_agua,20).
conecta(isabel_la_católica,pino_suárez,20).
conecta(pino_suárez,isabel_la_católica,10).
conecta(pino_suárez,merced,10).
conecta(merced,pino_suárez,20).
conecta(merced,candelaria,20).
conecta(candelaria,merced,10).
conecta(candelaria,san_lázaro,20).
conecta(san_lázaro,candelaria,20).
conecta(san_lázaro,moctezuma,10).
conecta(moctezuma,san_lázaro,20).
conecta(moctezuma,balbuena,10).
conecta(balbuena,moctezuma,10).
conecta(balbuena,boulevard_puerto_aéreo,10).
conecta(boulevard_puerto_aéreo,balbuena,10).
conecta(boulevard_puerto_aéreo,gómez_farías,10).
conecta(gómez_farías,boulevard_puerto_aéreo,10).
conecta(gómez_farías,zaragoza,10).
conecta(zaragoza,gómez_farías,10).
conecta(zaragoza,pantitlán,20).
conecta(pantitlán,zaragoza,10).

conecta(cuatro_caminos,panteones,10).
conecta(panteones,cuatro_caminos,5).
conecta(panteones,tacuba,20).
conecta(tacuba,panteones,10).
conecta(tacuba,cuitláhuac,10).
conecta(cuitláhuac,tacuba,20).
conecta(cuitláhuac,popotla,10).
conecta(popotla,cuitláhuac,10).
conecta(popotla,colegio_militar,10).
conecta(colegio_militar,popotla,10).
conecta(colegio_militar,normal,10).
conecta(normal,colegio_militar,10).
conecta(normal,san_cosme,10).
conecta(san_cosme,normal,10).
conecta(san_cosme,revolución,10).
conecta(revolución,san_cosme,10).
conecta(revolución,hidalgo,20).
conecta(hidalgo,revolución,10).
conecta(hidalgo,bellas_artes,20).
conecta(bellas_artes,hidalgo,20).
conecta(bellas_artes,allende,10).
conecta(allende,bellas_artes,20).
conecta(allende,zócalo,10).
conecta(zócalo,allende,10).
conecta(zócalo,pino_suárez,20).
conecta(pino_suárez,zócalo,10).
conecta(pino_suárez,san_antonio_abad,10).
conecta(san_antonio_abad,pino_suárez,20).
conecta(san_antonio_abad,chabacano,30).
conecta(chabacano,san_antonio_abad,10).
conecta(chabacano,viaducto,10).
conecta(viaducto,chabacano,30).
conecta(viaducto,xola,10).
conecta(xola,viaducto,10).
conecta(xola,villa_de_cortés,10).
conecta(villa_de_cortés,xola,10).
conecta(villa_de_cortés,nativitas,10).
conecta(nativitas,villa_de_cortés,10).
conecta(nativitas,portales,10).
conecta(portales,nativitas,10).
conecta(portales,ermita,20).
conecta(ermita,portales,10).
conecta(ermita,general_anaya,10).
conecta(general_anaya,ermita,20).
conecta(general_anaya,tasqueña,5).
conecta(tasqueña,general_anaya,10).

conecta(universidad,copilco,10).
conecta(copilco,universidad,5).
conecta(copilco,miguel_ángel_de_quevedo,10).
conecta(miguel_ángel_de_quevedo,copilco,10).
conecta(miguel_ángel_de_quevedo,viveros_derechos_humanos,10).
conecta(viveros_derechos_humanos,miguel_ángel_de_quevedo,10).
conecta(viveros_derechos_humanos,coyoacán,10).
conecta(coyoacán,viveros_derechos_humanos,10).
conecta(coyoacán,zapata,20).
conecta(zapata,coyoacán,10).
conecta(zapata,división_del_norte,10).
conecta(división_del_norte,zapata,20).
conecta(división_del_norte,eugenia,10).
conecta(eugenia,división_del_norte,10).
conecta(eugenia,etiopía_plaza_de_la_transparencia,10).
conecta(etiopía_plaza_de_la_transparencia,eugenia,10).
conecta(etiopía_plaza_de_la_transparencia,centro_medico,20).
conecta(centro_medico,etiopía_plaza_de_la_transparencia,10).
conecta(centro_medico,hospital_general,10).
conecta(hospital_general,centro_medico,20).
conecta(hospital_general,niños_héroes,10).
conecta(niños_héroes,hospital_general,10).
conecta(niños_héroes,balderas,20).
conecta(balderas,niños_héroes,10).
conecta(balderas,juárez,10).
conecta(juárez,balderas,20).
conecta(juárez,hidalgo,20).
conecta(hidalgo,juárez,10).
conecta(hidalgo,guerrero,20).
conecta(guerrero,hidalgo,20).
conecta(guerrero,tlatelolco,10).
conecta(tlatelolco,guerrero,20).
conecta(tlatelolco,la_raza,20).
conecta(la_raza,tlatelolco,10).
conecta(la_raza,potrero,10).
conecta(potrero,la_raza,20).
conecta(potrero,deportivo_18_de_marzo,20).
conecta(deportivo_18_de_marzo,potrero,10).
conecta(deportivo_18_de_marzo,indios_verdes,5).
conecta(indios_verdes,deportivo_18_de_marzo,20).

conecta(martín_carrera,talismán,10).
conecta(talismán,martín_carrera,10).
conecta(talismán,bondojito,10).
conecta(bondojito,talismán,10).
conecta(bondojito,consulado,20).
conecta(consulado,bondojito,10).
conecta(consulado,canal_del_norte,10).
conecta(canal_del_norte,consulado,20).
conecta(canal_del_norte,morelos,20).
conecta(morelos,canal_del_norte,10).
conecta(morelos,candelaria,20).
conecta(candelaria,morelos,20).
conecta(candelaria,fray_servando,10).
conecta(fray_servando,candelaria,20).
conecta(fray_servando,jamaica,20).
conecta(jamaica,fray_servando,10).
conecta(jamaica,santa_anita,15).
conecta(santa_anita,jamaica,20).

conecta(pantitlán,hangares,10).
conecta(hangares,pantitlán,20).
conecta(hangares,terminal_aérea,10).
conecta(terminal_aérea,hangares,10).
conecta(terminal_aérea,oceanía,20).
conecta(oceanía,terminal_aérea,10).
conecta(oceanía,aragón,10).
conecta(aragón,oceanía,20).
conecta(aragón,eduardo_molina,10).
conecta(eduardo_molina,aragón,10).
conecta(eduardo_molina,consulado,20).
conecta(consulado,eduardo_molina,10).
conecta(consulado,valle_gómez,10).
conecta(valle_gómez,consulado,20).
conecta(valle_gómez,misterios,10).
conecta(misterios,valle_gómez,10).
conecta(misterios,la_raza,20).
conecta(la_raza,misterios,10).
conecta(la_raza,autobuses_del_norte,10).
conecta(autobuses_del_norte,la_raza,20).
conecta(autobuses_del_norte,instituto_del_petróleo,20).
conecta(instituto_del_petróleo,autobuses_del_norte,10).
conecta(instituto_del_petróleo,politécnico,5).
conecta(politécnico,instituto_del_petróleo,20).

conecta(martín_carrera,la_villa_basílica,10).
conecta(la_villa_basílica,martín_carrera,10).
conecta(la_villa_basílica,deportivo_18_de_marzo,20).
conecta(deportivo_18_de_marzo,la_villa_basílica,10).
conecta(deportivo_18_de_marzo,lindavista,10).
conecta(lindavista,deportivo_18_de_marzo,20).
conecta(lindavista,instituto_del_petróleo,20).
conecta(instituto_del_petróleo,lindavista,10).
conecta(instituto_del_petróleo,vallejo,10).
conecta(vallejo,instituto_del_petróleo,20).
conecta(vallejo,norte_45,10).
conecta(norte_45,vallejo,10).
conecta(norte_45,ferrería_arena_ciudad_de_méxico,10).
conecta(ferrería_arena_ciudad_de_méxico,norte_45,10).
conecta(ferrería_arena_ciudad_de_méxico,azcapotzalco,10).
conecta(azcapotzalco,ferrería_arena_ciudad_de_méxico,10).
conecta(azcapotzalco,tezozómoc,10).
conecta(tezozómoc,azcapotzalco,10).
conecta(tezozómoc,el_rosario,10).
conecta(el_rosario,tezozómoc,10).

conecta(el_rosario,aquiles_serdán,10).
conecta(aquiles_serdán,el_rosario,10).
conecta(aquiles_serdán,camarones,10).
conecta(camarones,aquiles_serdán,10).
conecta(camarones,refinería,10).
conecta(refinería,camarones,10).
conecta(refinería,tacuba,20).
conecta(tacuba,refinería,10).
conecta(tacuba,san_joaquín,10).
conecta(san_joaquín,tacuba,20).
conecta(san_joaquín,polanco,10).
conecta(polanco,san_joaquín,10).
conecta(polanco,auditorio,10).
conecta(auditorio,polanco,10).
conecta(auditorio,constituyentes,10).
conecta(constituyentes,auditorio,10).
conecta(constituyentes,tacubaya,25).
conecta(tacubaya,constituyentes,10).
conecta(tacubaya,san_pedro_de_los_pinos,10).
conecta(san_pedro_de_los_pinos,tacubaya,25).
conecta(san_pedro_de_los_pinos,san_antonio,10).
conecta(san_antonio,san_pedro_de_los_pinos,10).
conecta(san_antonio,mixcoac,15).
conecta(mixcoac,san_antonio,10).
conecta(mixcoac,barranca_del_muerto,5).
conecta(barranca_del_muerto,mixcoac,15).

conecta(garibaldi_lagunilla,bellas_artes,20).
conecta(bellas_artes,garibaldi_lagunilla,15).
conecta(bellas_artes,san_juan_de_letrán,10).
conecta(san_juan_de_letrán,bellas_artes,20).
conecta(san_juan_de_letrán,salto_del_agua,20).
conecta(salto_del_agua,san_juan_de_letrán,10).
conecta(salto_del_agua,doctores,10).
conecta(doctores,salto_del_agua,20).
conecta(doctores,obrera,10).
conecta(obrera,doctores,10).
conecta(obrera,chabacano,30).
conecta(chabacano,obrera,10).
conecta(chabacano,la_viga,10).
conecta(la_viga,chabacano,30).
conecta(la_viga,santa_anita,15).
conecta(santa_anita,la_viga,10).
conecta(santa_anita,coyuya,10).
conecta(coyuya,santa_anita,15).
conecta(coyuya,iztacalco,10).
conecta(iztacalco,coyuya,10).
conecta(iztacalco,apatlaco,10).
conecta(apatlaco,iztacalco,10).
conecta(apatlaco,aculco,10).
conecta(aculco,apatlaco,10).
conecta(aculco,escuadrón_201,10).
conecta(escuadrón_201,aculco,10).
conecta(escuadrón_201,atlalilco,20).
conecta(atlalilco,escuadrón_201,10).
conecta(atlalilco,iztapalapa,10).
conecta(iztapalapa,atlalilco,20).
conecta(iztapalapa,cerro_de_la_estrella,10).
conecta(cerro_de_la_estrella,iztapalapa,10).
conecta(cerro_de_la_estrella,uam_i,10).
conecta(uam_i,cerro_de_la_estrella,10).
conecta(uam_i,constitución_de_1917,5).
conecta(constitución_de_1917,uam_i,10).

conecta(pantitlán,puebla,10).
conecta(puebla,pantitlán,20).
conecta(puebla,ciudad_deportiva,10).
conecta(ciudad_deportiva,puebla,10).
conecta(ciudad_deportiva,velódromo,10).
conecta(velódromo,ciudad_deportiva,10).
conecta(velódromo,mixiuhca,10).
conecta(mixiuhca,velódromo,10).
conecta(mixiuhca,jamaica,20).
conecta(jamaica,mixiuhca,10).
conecta(jamaica,chabacano,30).
conecta(chabacano,jamaica,20).
conecta(chabacano,lázaro_cárdenas,10).
conecta(lázaro_cárdenas,chabacano,30).
conecta(lázaro_cárdenas,centro_medico,20).
conecta(centro_medico,lázaro_cárdenas,10).
conecta(centro_medico,chilpancingo,10).
conecta(chilpancingo,centro_medico,20).
conecta(chilpancingo,patriotismo,10).
conecta(patriotismo,chilpancingo,10).
conecta(patriotismo,tacubaya,25).
conecta(tacubaya,patriotismo,10).

conecta(pantitlán,agrícola_oriental,10).
conecta(agrícola_oriental,pantitlán,20).
conecta(agrícola_oriental,canal_de_san_juan,10).
conecta(canal_de_san_juan,agrícola_oriental,10).
conecta(canal_de_san_juan,tepalcates,10).
conecta(tepalcates,canal_de_san_juan,10).
conecta(tepalcates,guelatao,10).
conecta(guelatao,tepalcates,10).
conecta(guelatao,peñón_viejo,10).
conecta(peñón_viejo,guelatao,10).
conecta(peñón_viejo,acatitla,10).
conecta(acatitla,peñón_viejo,10).
conecta(acatitla,santa_marta,10).
conecta(santa_marta,acatitla,10).
conecta(santa_marta,los_reyes,10).
conecta(los_reyes,santa_marta,10).
conecta(los_reyes,la_paz,5).
conecta(la_paz,los_reyes,10).

conecta(ciudad_azteca,plaza_aragón,10).
conecta(plaza_aragón,ciudad_azteca,5).
conecta(plaza_aragón,olímpia,10).
conecta(olímpia,plaza_aragón,10).
conecta(olímpia,ecatepec,10).
conecta(ecatepec,olímpia,10).
conecta(ecatepec,múzquiz,10).
conecta(múzquiz,ecatepec,10).
conecta(múzquiz,rio_de_los_remedios,10).
conecta(rio_de_los_remedios,múzquiz,10).
conecta(rio_de_los_remedios,impulsora,10).
conecta(impulsora,rio_de_los_remedios,10).
conecta(impulsora,nezahualcóyotl,10).
conecta(nezahualcóyotl,impulsora,10).
conecta(nezahualcóyotl,villa_de_aragón,10).
conecta(villa_de_aragón,nezahualcóyotl,10).
conecta(villa_de_aragón,bosque_de_aragón,10).
conecta(bosque_de_aragón,villa_de_aragón,10).
conecta(bosque_de_aragón,deportivo_oceanía,10).
conecta(deportivo_oceanía,bosque_de_aragón,10).
conecta(deportivo_oceanía,oceanía,20).
conecta(oceanía,deportivo_oceanía,10).
conecta(oceanía,romero_rubio,10).
conecta(romero_rubio,oceanía,20).
conecta(romero_rubio,flores_magón,10).
conecta(flores_magón,romero_rubio,10).
conecta(flores_magón,san_lázaro,20).
conecta(san_lázaro,flores_magón,10).
conecta(san_lázaro,morelos,20).
conecta(morelos,san_lázaro,20).
conecta(san_lázaro,morelos,20).
conecta(morelos,san_lázaro,20).
conecta(morelos,tepito,10).
conecta(tepito,morelos,20).
conecta(tepito,lagunilla,10).
conecta(lagunilla,tepito,10).
conecta(lagunilla,garibaldi_lagunilla,15).
conecta(garibaldi_lagunilla,lagunilla,10).
conecta(garibaldi_lagunilla,guerrero,20).
conecta(guerrero,garibaldi_lagunilla,15).
conecta(guerrero,buenavista,5).
conecta(buenavista,guerrero,20).

conecta(mixcoac,insurgentes_sur,10).
conecta(insurgentes_sur,mixcoac,15).
conecta(insurgentes_sur,hospital_20_de_noviembre,10).
conecta(hospital_20_de_noviembre,insurgentes_sur,10).
conecta(hospital_20_de_noviembre,zapata,20).
conecta(zapata,hospital_20_de_noviembre,10).
conecta(zapata,parque_de_los_venados,10).
conecta(parque_de_los_venados,zapata,20).
conecta(parque_de_los_venados,eje_central,10).
conecta(eje_central,parque_de_los_venados,10).
conecta(eje_central,ermita,20).
conecta(ermita,eje_central,10).
conecta(ermita,mexicaltzingo,10).
conecta(mexicaltzingo,ermita,20).
conecta(mexicaltzingo,atlalilco,20).
conecta(atlalilco,mexicaltzingo,10).
conecta(atlalilco,culhuacán,10).
conecta(culhuacán,atlalilco,20).
conecta(culhuacán,san_andrés_tomatlán,10).
conecta(san_andrés_tomatlán,culhuacán,10).
conecta(san_andrés_tomatlán,lomas_estrella,10).
conecta(lomas_estrella,san_andrés_tomatlán,10).
conecta(lomas_estrella,calle_11,10).
conecta(calle_11,lomas_estrella,10).
conecta(calle_11,periférico_oriente,10).
conecta(periférico_oriente,calle_11,10).
conecta(periférico_oriente,tezonco,10).
conecta(tezonco,periférico_oriente,10).
conecta(tezonco,olivos,10).
conecta(olivos,tezonco,10).
conecta(olivos,nopalera,10).
conecta(nopalera,olivos,10).
conecta(nopalera,zapotitlán,10).
conecta(zapotitlán,nopalera,10).
conecta(zapotitlán,tlaltenco,10).
conecta(tlaltenco,zapotitlán,10).
conecta(tlaltenco,tláhuac,5).
conecta(tláhuac,tlaltenco,10).

%=======================================================================
% primer_elemento/2.
%
% Indica el primer primer elemento de una lista.
% El primer parámetro es una lista.
% El segundo es el primer elemento de la lista.
%=======================================================================

primer_elemento([P|_],P).

%=======================================================================
% costo/5.
%
% Busca que la última y penúltima estación pertenecen a la misma línea,
% de no ser así, incrementa 10 mín. el costo.
% Los primeros 2 parámetros indican las estaciones a analizar.
% Los siguientes 2 paramatros son el costo calculado hasta ahora y el
% costo ingrementado de la nueva estación.
% El último parámetro es el costo total.
%=======================================================================

costo(E1,E2,C1,C2,Costo):- (estacion(E1,L), estacion(E2,L))-> Costo is C1+C2;
                                                              Costo is C1+C2+10.

%=======================================================================
% navegar/5.
%
% Ayuda al predicado ruta/4 a encontrar una ruta para llegar de una
% estación a otra.
% Los primeros 2 parámetros indican la estación desde donde se parte y
% la estación a la que se quiere llegar.
% El tercer parámetro son las estaciones visitadas.
% El cuarto parámetro es la ruta que se va generando.
% El último parámetro es el costo de la ruta generada.
%=======================================================================

navegar(A,A,_,[A],0):- !.
navegar(A,B,Visitado,[B|Visitado],Costo):- conecta(A,B,Costo).
navegar(A,B,Visitado,Ruta,Costo):- conecta(A,Z,C1),
                                   \+ member(Z,Visitado),
                                   Z \== B,
                                   navegar(Z,B,[Z|Visitado],Ruta,C2),
                                   primer_elemento(Visitado,X),
                                   primer_elemento(Ruta,Y),
                                   costo(X,Y,C1,C2,Costo).

%=======================================================================
% ruta/4.
%
% Establece las posibles rutas y sus costos para ir de una estación a
% otra.
% El primer parámetro es la estación de la que se quiere partir.
% El segundo parámetro es la estación a la que se quiere llegar.
% El tercer parámetro es la ruta recorrida hasta llegar a la estación
% establecida.
% El cuarto parámetro es el costo de la ruta recorrida
%=======================================================================

ruta(A,B,Ruta,Costo):- navegar(A,B,[A],R,Costo),
                       reverse(R,Ruta).

%=======================================================================
% calcula_rutas/3.
%
% Recopila todas las posibles rutas entre dos estaciones.
% Los primeros dos parámetros son las estaciones de partida y llegada.
% El tercer parámetro es una lista con las rutas para llegar al destido
% y el costo de cada ruta separado por un guion. Por ejemplo [[a,b,c]-3].
%=======================================================================

calcula_rutas(A,B,Rutas):- findall(R-C,ruta(A,B,R,C),Rutas).

%=======================================================================
% ruta_corta/3.
%
% Dada una lista de rutas con el costo de cada ruta, este predicado nos
% devuelve una lista con las rutas de menor costo y el costo que estas
% tienen.
% El primer parámetro es la lista de rutas y costos separados por un
% guion.
% El segundo parámetro es la lista de rutas con menor costo.
% El tercer parámetro es el menor costo que se puede encontrar.
% Usamos 'menor o igual' y 'mayor o igual' debido a que pueden existir
% rutas con el mismo costo pero diferentes.
%=======================================================================

ruta_corta([R-C],R,C).
ruta_corta([R1-C1,R2-C2|Resto],R,C):- (C1 =< C2,
                                      ruta_corta([R1-C1|Resto],R,C));
                                      (C1 >= C2,
                                      ruta_corta([R2-C2|Resto],R,C)).

%=======================================================================
% mejor_ruta/4.
%
% Con la ayuda de los predicados calcula_rutas/3 y ruta_corta/3; dadas
% dos estaciones nos devuelve la mejor ruta y su costo.
% Los primeros dos parámetros son la estación de partida y de destino.
% El tercer parámetro es la mejor ruta.
% El cuarto parámetro es el costo de la mejor ruta.
%=======================================================================

mejor_ruta(A,B,Mejor,Costo):- calcula_rutas(A,B,Rutas),
                              ruta_corta(Rutas,Mejor,Costo).

%=======================================================================
% eliminar_duplicados/2.
%
% Este predicado elimina duplicados en una lista.
% El primer parámetro es la lista de entrada.
% El segundo parámetro es la lista sin elementos duplicados.
% Este predicado es usado para evitar que las rutas encontradas sean
% duplicadas.
%=======================================================================

eliminar_duplicados([],[]).
eliminar_duplicados([X|Lista],[X|Salida]):- \+ member(X,Lista),
                                            eliminar_duplicados(Lista,Salida).
eliminar_duplicados([X|Lista],Salida):- member(X,Lista),
                                        eliminar_duplicados(Lista,Salida).

%=======================================================================
% mejores_rutas/3
%
% Recopila todas las mejores rutas que pueden existir entre dos
% estaciones.
% Los primeros dos parámetro son la estación de partida y de destino.
% El tercer parámetro es una lista con las mejores rutas y sus
% respectivos costos separados por un guion. Por ejemplo [[a,b,c]-3].
%=======================================================================

mejores_rutas(A,B,Resultado):- findall(R-C, mejor_ruta(A,B,R,C),Mejores),
                               eliminar_duplicados(Mejores,Resultado),!.

%=======================================================================
% ruta_larga/3.
%
% Dada una lista de rutas con el costo de cada ruta, este predicado nos
% devuelve una lista con las rutas de mayor costo y el costo que estas
% tienen.
% El primer parámetro es la lista de rutas y costos separados por un
% guion.
% El segundo parámetro es la lista de rutas con mayor costo.
% El tercer parámetro es el mayor costo que se puede encontrar.
% Usamos 'menor o igual' y 'mayor o igual' debido a que pueden existir
% rutas con el mismo costo pero diferentes.
%=======================================================================

ruta_larga([R-C],R,C).
ruta_larga([R1-C1,R2-C2|Resto],R,C):- (C1 >= C2,
                                      ruta_larga([R1-C1|Resto],R,C));
                                      (C1 =< C2,
                                      ruta_larga([R2-C2|Resto],R,C)).

%=======================================================================
% peor_ruta/4.
%
% Con la ayuda de los predicados calcula_rutas/3 y ruta_larga/3; dadas
% dos estaciones nos devuelve la peor ruta y su costo.
% Los primeros dos parámetros son la estación de partida y de destino.
% El tercer parámetro es la peor ruta.
% El cuarto parámetro es el costo de la peor ruta.
%=======================================================================

peor_ruta(A,B,Peor,Costo):- calcula_rutas(A,B,Rutas),
                            ruta_larga(Rutas,Peor,Costo).

%=======================================================================
% peores_rutas/3
%
% Recopila todas las peores rutas que pueden existir entre dos
% estaciones.
% Los primeros dos parámetro son la estación de partida y de destino.
% El tercer parámetro es una lista con las peores rutas y sus
% respectivos costos separados por un guion. Por ejemplo [[a,b,c]-3].
%=======================================================================

peores_rutas(A,B,Resultado):- findall(R-C, peor_ruta(A,B,R,C),Peores),
                              eliminar_duplicados(Peores,Resultado),!.

%=======================================================================
% sistema_metro/0.
%
% Pregunta al usuario dos nombres de estaciones y calcula tanto la mejor
% como la pero ruta entre esas dos estaciones.
%=======================================================================

sistema_metro():- write('\nDame una estación del metro de la CDMX\n'),
                  read(E1),
                  write('\nDame otra estación del metro de la CDMX\n'),
                  read(E2),
                  mejores_rutas(E1,E2,R1),
                  write('\nLa mejor ruta es\n'),
                  write(R1),
                  peores_rutas(E1,E2,R2),
                  write('\nLa peor ruta es\n'),
                  write(R2).
