package hackathon


import grails.plugin.jyoshiriro.jasperResponse.renderers.Jasper
import net.sf.jasperreports.engine.JRPrintPage
import net.sf.jasperreports.engine.JasperCompileManager
import net.sf.jasperreports.engine.JasperExportManager
import net.sf.jasperreports.engine.JasperFillManager
import net.sf.jasperreports.engine.JasperPrint
import net.sf.jasperreports.engine.JasperReport
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource
import org.springframework.security.access.annotation.Secured

@Secured(['ROLE_ADMIN'])
class HistorialController {

    def index() {}

    def inicio(){

    }

    def _modalPDF() {

        def grupos = Sitio.executeQuery("SELECT new map(s.nombre as nombre,s.id as idd) from Sitio s")

        [sitios:grupos]

    }

    def reporte(){

        String applicationPath = request.getSession().getServletContext().getRealPath("")
        def resul
        JasperPrint jp1
        params.logo = applicationPath + "/images/logo.png"

        def a = params.list("check").size()

        if(a==0){

            resul = Sitio.executeQuery("SELECT nombre FROM Sitio")

            for (int i = 0; i < resul.size() ; i++) {

                def resul2

                resul2 = Historial.executeQuery("select new map( h.id as id, u.username as usuario, p.nombre as chofer ,p.apPaterno as apP,p.apMaterno as apM , h.fecha as fecha , h.monto as monto,s.nombre as sitio) from Sitio s,Cliente c, Chofer ch, Historial h, Usuario u,Persona p,Taxi t where c.id = h.cliente and ch.id=h.chofer and ch.usuario = u.id and u.persona = p.id and ch.id=t.chofer and t.sitio = s.id")


                for (int j = 0; j < resul2.size(); j++) {


                     resul2[j].chofer = resul2[j].chofer + " " + resul2[j].apP +" " + resul2[j].apM




                }

                params.tabla = new JRBeanCollectionDataSource(resul2);
                JasperReport report = JasperCompileManager.compileReport(applicationPath + "/reports/historial.jrxml");
                JasperReport report2 = JasperCompileManager.compileReport(applicationPath + "/reports/auxiliar.jrxml");

                if(i>0){

                    JasperPrint jp2 = JasperFillManager.fillReport(report2, params, new JRBeanCollectionDataSource(resul2));

                    List pages = jp2.getPages();
                    for (int j = 0; j < pages.size(); j++) {
                        JRPrintPage object = (JRPrintPage) pages.get(j);
                        jp1.addPage(object);

                    }

                }else{

                    jp1 = JasperFillManager.fillReport(report, params, new JRBeanCollectionDataSource(resul2));

                }
            }

        }else{


            for (int i = 0; i < a ; i++) {

                def resul2

                if(a==1){

                    resul2 = Historial.executeQuery("select new map(  h.id as id,u.username as usuario, p.nombre as chofer ,p.apPaterno as apP,p.apMaterno as apM , h.fecha as fecha , h.monto as monto,s.nombre as sitio) from Sitio s,Cliente c, Chofer ch, Historial h, Usuario u,Persona p,Taxi t where c.id = h.cliente and ch.id=h.chofer and ch.usuario = u.id and u.persona = p.id and ch.id=t.chofer and t.sitio ="+params.check)


                }else{

                    resul2 = Historial.executeQuery("select new map(  h.id as id,u.username as usuario, p.nombre as chofer ,p.apPaterno as apP,p.apMaterno as apM , h.fecha as fecha , h.monto as monto,s.nombre as sitio) from Sitio s,Cliente c, Chofer ch, Historial h, Usuario u,Persona p,Taxi t where c.id = h.cliente and ch.id=h.chofer and ch.usuario = u.id and u.persona = p.id and ch.id=t.chofer and t.sitio ="+params.check[i])

                }
                for (int j = 0; j < resul2.size(); j++) {


                    resul2[j].chofer = resul2[j].chofer + " " + resul2[j].apP +" " + resul2[j].apM

                }


                params.tabla = new JRBeanCollectionDataSource(resul2);

                JasperReport report = JasperCompileManager.compileReport(applicationPath + "/reports/historial.jrxml");
                JasperReport report2 = JasperCompileManager.compileReport(applicationPath + "/reports/auxiliar.jrxml");

                if(i>0){

                    JasperPrint jp2 = JasperFillManager.fillReport(report2, params, new JRBeanCollectionDataSource(resul2));

                    List pages = jp2.getPages();
                    for (int j = 0; j < pages.size(); j++) {
                        JRPrintPage object = (JRPrintPage) pages.get(j);
                        jp1.addPage(object);

                    }

                }else{

                    jp1 = JasperFillManager.fillReport(report, params, new JRBeanCollectionDataSource(resul2));

                }
            }


        }



        JasperExportManager.exportReportToPdfFile(jp1,
                applicationPath+"/reports/ReporteD");


        FileInputStream file =  new FileInputStream( applicationPath+"/reports/ReporteD")

        int tamanoInput = file.available();
        byte[] datosPDF = new byte[tamanoInput];
        file.read( datosPDF, 0, tamanoInput);
        response.setContentType("application/pdf");
        response.setContentLength(tamanoInput);
        response.getOutputStream().write(datosPDF);
        file.close()

    }
}
