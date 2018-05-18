
package fia.ues.sv.libues.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Set;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import java.beans.PropertyEditorSupport;

import org.apache.commons.codec.binary.Base64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.context.MessageSource;
import org.springframework.security.authentication.AuthenticationTrustResolver;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.rememberme.PersistentTokenBasedRememberMeServices;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import fia.ues.sv.libues.modelo.Autor;
import fia.ues.sv.libues.modelo.Book;
import fia.ues.sv.libues.modelo.DetalleRetaceo;
import fia.ues.sv.libues.modelo.DetalleTransferencia;
import fia.ues.sv.libues.modelo.Editorial;
import fia.ues.sv.libues.modelo.Etiqueta;
import fia.ues.sv.libues.modelo.Factura;
import fia.ues.sv.libues.modelo.FacturaDetalle;
import fia.ues.sv.libues.modelo.Proveedor;
import fia.ues.sv.libues.modelo.Requisicion;
import fia.ues.sv.libues.modelo.Reservas;
import fia.ues.sv.libues.modelo.Retaceo;
import fia.ues.sv.libues.modelo.TipoProducto;
import fia.ues.sv.libues.modelo.Transferencia;
import fia.ues.sv.libues.modelo.Producto;
import fia.ues.sv.libues.modelo.User;
import fia.ues.sv.libues.modelo.Ajuste;
import fia.ues.sv.libues.modelo.Area;
import fia.ues.sv.libues.modelo.Busqueda;
import fia.ues.sv.libues.modelo.Cotizacion;
import fia.ues.sv.libues.modelo.DetalleCotizacion;
import fia.ues.sv.libues.modelo.DetalleRequisicion;
import fia.ues.sv.libues.modelo.UserProfile;
import fia.ues.sv.libues.service.AutorService;
import fia.ues.sv.libues.service.CotizacionService;
import fia.ues.sv.libues.service.DetalleCotizacionService;
import fia.ues.sv.libues.service.DetalleRequisicionService;
import fia.ues.sv.libues.service.DetalleRetaceoService;
import fia.ues.sv.libues.service.DetalleTransferenciaService;
import fia.ues.sv.libues.service.EditorialService;
import fia.ues.sv.libues.service.EtiquetaService;
import fia.ues.sv.libues.service.FacturaDetalleService;
import fia.ues.sv.libues.service.FacturaService;
import fia.ues.sv.libues.service.ProveedorService;
import fia.ues.sv.libues.service.RequisicionService;
import fia.ues.sv.libues.service.ReservasService;
import fia.ues.sv.libues.service.RetaceoService;
import fia.ues.sv.libues.service.TipoProductoService;
import fia.ues.sv.libues.service.TransferenciaService;
import fia.ues.sv.libues.service.ProductoService;
import fia.ues.sv.libues.service.UserProfileService;
import fia.ues.sv.libues.service.UserService;
import fia.ues.sv.libues.service.AjusteService;
import fia.ues.sv.libues.service.AreaService;
import fia.ues.sv.libues.excell.excell;

@Controller
@RequestMapping("/")
@SessionAttributes("roles")
public class AppControllerLibues {
	
	//*************************************************************************
    // ***************** DECLARACION DE BEANS ***********************************
    //*************************************************************************
	@Autowired
	AreaService areaService;
		
	@Autowired
	UserService userService;
	
	@Autowired
	UserProfileService userProfileService;
	
	@Autowired
	MessageSource messageSource;
	
	@Autowired
	EditorialService editorialService;
	
	/*@Autowired
	LocalizacionService localizacionService; */
		
	@Autowired
	AutorService autorService;
	
	@Autowired
	ProveedorService proveedorService;
	
	@Autowired
	TipoProductoService tipoProductoService;
	
	@Autowired
	ProductoService productoService;
	
	@Autowired
	DetalleRequisicionService detallerequisicionService;
	
	@Autowired
	RequisicionService requisicionService;
	
	@Autowired
	FacturaService facturaService;
	
	@Autowired
	FacturaDetalleService facturadetalleService;
	
	@Autowired
	ReservasService reservasService;
	
	@Autowired
	RetaceoService retaceoService;
	
	@Autowired
	TransferenciaService transferenciaService;
			
	@Autowired
	DetalleRetaceoService detalleretaceoService;
	
	@Autowired
	DetalleTransferenciaService detalletransferenciaService;
	
	@Autowired
	CotizacionService cotizacionService;
	
	@Autowired
	EtiquetaService etiquetaService;
	
	@Autowired
	DetalleCotizacionService detallecotizacionService;
			
	@Autowired
	PersistentTokenBasedRememberMeServices persistentTokenBasedRememberMeServices;
	
	@Autowired
	AuthenticationTrustResolver authenticationTrustResolver;
	
	@Autowired
	AjusteService ajusteService;
	
	
	 //*************************************************************************
    // ***************** METODOS PARA LISTAR EN TABLAS**************************
    //*************************************************************************
	
    @ModelAttribute("roles")
    public List<UserProfile> initializeProfiles() {
        return userProfileService.findAll();
    }
    
    
    @ModelAttribute("editoriales")
    public List<Editorial> initializeEditoriales() {
        return editorialService.findAllEditoriales();
    }
    
    /*@ModelAttribute("localizaciones")
    public List<Localizacion> initializeLocalizacion() {
        return localizacionService.findAllLocalizaciones();
    }*/
    
    @ModelAttribute("proveedores")
    public List<Proveedor> initializeProveedores() {
        return proveedorService.findAllProveedores();
    }
    
    @ModelAttribute("areas")
    public List<Area> initializeAreas() {
        return areaService.findAllAreas();
    }
    
    @ModelAttribute("tipoproductos")
    public List<TipoProducto> initializeTipoProductos() {
        return tipoProductoService.findAllTipoProductos();
    }
    
    @ModelAttribute("productos")
    public List<Producto> initializeProductos() {
        return productoService.findAllProductos();
    }
    
    @ModelAttribute("autores")
    public List<Autor> initializeAutores() {
        return autorService.findAllAutors();
    }
    
    @ModelAttribute("detalleretaceos")
    public List<DetalleRetaceo> initializedetalleRetaceos() {
        return detalleretaceoService.findAllRetaceos();
    }
    
    @ModelAttribute("detalletransferencias")
    public List<DetalleTransferencia> initializedetalleTransferencias(){
    	return detalletransferenciaService.findAllTransferencias();
    }
    
    @ModelAttribute("detallerequisiciones")
    public List<DetalleRequisicion> initializedetalleRequisiciones(){
    	return detallerequisicionService.findAllRequisiciones();
    }
    
    @ModelAttribute("facturasdetalle")
    public List<FacturaDetalle> initializeFacturasDetalle(){
    	return facturadetalleService.findAllFacturas();
    }
    
    @ModelAttribute("facturas")
    public List<Factura> initializeFacturas(){
    	return facturaService.findAllFacturas();
    }
    
    /*
    @ModelAttribute("cotizaciones")
    public List<Cotizacion> initializeCotizaciones(){
    	return cotizacionService.findAllCotizaciones();
    }*/
    
    @ModelAttribute("detallecotizaciones")
    public List<DetalleCotizacion> initializedetalleCotizaciones(){
    	return detallecotizacionService.findAllCotizaciones();
    }
    
    @ModelAttribute("reservaciones")
    public List<Reservas> initializeReservas(){
    	return reservasService.findAllReservas();
    }
    
    @ModelAttribute("etiquetas")
    public List<Etiqueta> initializeEtiquetas(){
    	return etiquetaService.findAllEtiquetas();
    }
   /* @ModelAttribute("retaceos")
    public List<Retaceo> initializeRetaceos() {
        return retaceoService.findAllRetaceos();
    }*/
    
    
    
    
	//*************************************************************************
    // ***************** LOGUEO DE USUARIOS************************************
    //*************************************************************************
	/**
     * Este Metodo mostrara todos los usuarios existentes.
     */
    @RequestMapping(value = { "/list" }, method = RequestMethod.GET)
    public String listUsers(ModelMap model) {
 
        List<User> users = userService.findAllUsers();
        model.addAttribute("users", users);
        model.addAttribute("loggedinuser", getPrincipal());
        return "userslist";
    }
    
    @RequestMapping(value = { "/", "/index" }, method = RequestMethod.GET)
    public String main(ModelMap model) {
 
       
        model.addAttribute("loggedinuser", getPrincipal());
        return "index";
    }
 
    @RequestMapping(value = { "/newuser" }, method = RequestMethod.GET)
    public String newUser(ModelMap model) {
        User user = new User();
        model.addAttribute("user", user);
        model.addAttribute("edit", false);
        model.addAttribute("loggedinuser", getPrincipal());
        return "registration";
    }
 
    /**
     * Se llamar� a este m�todo en el env�o del formulario, manejando la solicitud POST para
     * guardar usuario en la base de datos. Tambi�n valida la entrada del usuario.
     */
    @RequestMapping(value = { "/newuser" }, method = RequestMethod.POST)
    public String saveUser(@Valid User user, BindingResult result,
            ModelMap model) {
 
        if (result.hasErrors()) {
            return "registration";
        }
 
        if(!userService.isUserSSOUnique(user.getId(), user.getSsoId())){
            FieldError ssoError =new FieldError("user","ssoId",messageSource.getMessage("non.unique.ssoId", new String[]{user.getSsoId()}, Locale.getDefault()));
            result.addError(ssoError);
            return "registration";
        }
         
        userService.saveUser(user);
 
        //model.addAttribute("success", "Usuario " + user.getFirstName() + " "+ user.getLastName() + " Registrado Correctamente");
        model.addAttribute("loggedinuser", getPrincipal());
        //return "success";
        return "redirect:/list";
    }
 
       /**
     * Este metodo provee el medio para actualizar un usuario existente.
     */
    @RequestMapping(value = { "/edit-user-{ssoId}" }, method = RequestMethod.GET)
    public String editUser(@PathVariable String ssoId, ModelMap model) {
        User user = userService.findBySSO(ssoId);
        model.addAttribute("user", user);
        model.addAttribute("edit", true);
        model.addAttribute("loggedinuser", getPrincipal());
        return "registration";
    }
     
    /**
     * Se llamar� a este m�todo en el env�o del formulario, manejando la solicitud POST para
     * actualizar un usuario en la base de datos. Tambi�n valida la entrada del usuario.
     *      */
    @RequestMapping(value = { "/edit-user-{ssoId}" }, method = RequestMethod.POST)
    public String updateUser(@Valid User user, BindingResult result,
            ModelMap model, @PathVariable String ssoId) {
 
        if (result.hasErrors()) {
            return "registration";
        }
 
        /*//Uncomment below 'if block' if you WANT TO ALLOW UPDATING SSO_ID in UI which is a unique key to a User.
        if(!userService.isUserSSOUnique(user.getId(), user.getSsoId())){
            FieldError ssoError =new FieldError("user","ssoId",messageSource.getMessage("non.unique.ssoId", new String[]{user.getSsoId()}, Locale.getDefault()));
            result.addError(ssoError);
            return "registration";
        }*/
 
 
        userService.updateUser(user);
 
        //model.addAttribute("success", "Usuario " + user.getFirstName() + " "+ user.getLastName() + " Actualizado Correctamente");
        model.addAttribute("loggedinuser", getPrincipal());
        //return "registrationsuccess";
        return "redirect:/list";
    }
 
     
    /**
     *Este metodo borrara un usuario por su valor SSOID.
     */
    @RequestMapping(value = { "/delete-user-{ssoId}" }, method = RequestMethod.GET)
    public String deleteUser(@PathVariable String ssoId) {
        userService.deleteUserBySSO(ssoId);
        return "redirect:/list";
    }
     

    /**
     *Este m�todo maneja la redirecci�n de acceso denegado.
     */
    @RequestMapping(value = "/Access_Denied", method = RequestMethod.GET)
    public String accessDeniedPage(ModelMap model) {
        model.addAttribute("loggedinuser", getPrincipal());
        return "accessdenied";
    }
 
    /**
     *Este m�todo maneja las solicitudes GET de inicio de sesi�n.
     * Si los usuarios ya iniciaron sesi�n e intentan volver a la p�gina de inicio de sesi�n, se les redirigir� a la p�gina de la lista.
     */
    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String loginPage() {
        if (isCurrentAuthenticationAnonymous()) {
            return "login";
        } else {
            return "redirect:/index";  
        }
    }
 
    /**
     * Este m�todo maneja las solicitudes de cierre de sesi�n.
     */
    @RequestMapping(value="/logout", method = RequestMethod.GET)
    public String logoutPage (HttpServletRequest request, HttpServletResponse response){
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth != null){    
            //new SecurityContextLogoutHandler().logout(request, response, auth);
            persistentTokenBasedRememberMeServices.logout(request, response, auth);
            SecurityContextHolder.getContext().setAuthentication(null);
        }
        return "redirect:/login?logout";
    }
 
    /**
     * Este m�todo devuelve el nombre de usuario que inici� sesi�n.
     */
    private String getPrincipal(){
        String userName = null;
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
 
        if (principal instanceof UserDetails) {
            userName = ((UserDetails)principal).getUsername();
        } else {
            userName = principal.toString();
        }
        return userName;
    }
     
    /**
     * Este m�todo devuelve verdadero si los usuarios ya est�n autenticados [conectados], de lo contrario es falso.
     */
    private boolean isCurrentAuthenticationAnonymous() {
        final Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        return authenticationTrustResolver.isAnonymous(authentication);
    }
    
    //*************************************************************************
    // ***************** CONTROLES DE AREAS ***********************************
    //*************************************************************************
    
    @RequestMapping(value = { "/area-list" }, method = RequestMethod.GET)
    public String listAreas(ModelMap model) throws IOException { 
        List<Area> area = areaService.findAllAreas();                
        model.addAttribute("area", area);
        model.addAttribute("loggedinuser", getPrincipal());
        return "area-list";
    }
    
    @RequestMapping(value = { "/area-list-deleted" }, method = RequestMethod.GET)
    public String listAreasDeleted(ModelMap model) throws IOException {
        List<Area> area = areaService.findAllAreasDeleted();                
        model.addAttribute("area", area);
        model.addAttribute("loggedinuser", getPrincipal());
        return "area-list-deleted";
    } 
    
    @RequestMapping(value = { "/area-agregar" }, method = RequestMethod.GET)
    public String newArea(ModelMap model) {
        Area area = new Area();
        model.addAttribute("area", area);
        model.addAttribute("edit", false);
        model.addAttribute("loggedinuser", getPrincipal());
        //model.addAttribute("area", getPrincipal());
        return "area-reg";
    }
    
    @RequestMapping(value = { "/area-agregar" }, method = RequestMethod.POST)
    public String saveArea(@Valid Area area, BindingResult result, ModelMap model) throws IOException { 
    	if (result.hasErrors()) {
            return "area-reg";
        }                 	  	
    	areaService.saveArea(area);
    	//model.addAttribute("success", "Area: <strong>" + area.getNombrearea() + "</strong> Registrado");
        model.addAttribute("loggedinuser", getPrincipal());
        //return "success";
        //return "area-reg-succ";
        return "redirect:/area-agregar";
    }
    
    @RequestMapping(value = { "/edit-area-{codigoarea}" }, method = RequestMethod.GET)
    public String editArea(@PathVariable Integer codigoarea, ModelMap model) {
    	Area area = areaService.findById(codigoarea);
    	model.addAttribute("area", area);
        model.addAttribute("edit", true);
        model.addAttribute("loggedinuser", getPrincipal());
        return "area-reg";
    }
 
    @RequestMapping(value = { "/edit-area-{codigoarea}" }, method = RequestMethod.POST)
    public String updateArea(@Valid Area area, BindingResult result, ModelMap model, @PathVariable Integer codigoarea) throws IOException {
 
        if (result.hasErrors()) {
            return "area-reg";
        } 
        areaService.updateArea(area);
        //model.addAttribute("success", "Area: <strong>" + area.getNombrearea()+"</strong> Se ha Actualizado ");
        model.addAttribute("loggedinuser", getPrincipal());
        //return "area-reg-succ";
        return "redirect:/area-list";
    }
    
    /*
    @RequestMapping(value = { "/lista-todas-areas}" }, method = RequestMethod.GET)
    public String ListaTodasAreas(ModelMap model) throws IOException {    	
    	List<Area> area = areaService.findAllAreasDeleted();
    	model.addAttribute("area", area);
    	model.addAttribute("loggedinuser", getPrincipal());
        return "redirect:/area-list";
    }*/
    
    @RequestMapping(value = { "/delete-area-{codigoarea}" }, method = RequestMethod.GET)
    public String deleteArea(@PathVariable Integer codigoarea) {
    	
    	areaService.deleteAreaById(codigoarea);
        return "redirect:/area-list";
    }
    
    @RequestMapping(value = { "/estado-borrar-area-{codigoarea}" }, method = RequestMethod.GET)
    public String updateAreaDeleted(@PathVariable Integer codigoarea) {    	
    	areaService.estadoBorrarAreaById(codigoarea);
        return "redirect:/area-list";
    }
    
    @RequestMapping(value = { "/estado-restaurar-area-{codigoarea}" }, method = RequestMethod.GET)
    public String updateAreaRestore(@PathVariable Integer codigoarea) {    	
    	areaService.estadoRestaurarAreaById(codigoarea);
        return "redirect:/area-list";
    }
    
    //*************************************************************************
    // ***************** CONTROLES DE AUTORES *********************************
    //*************************************************************************
    
      @RequestMapping(value = { "/autor-list" }, method = RequestMethod.GET)
    public String listAutores(ModelMap model) throws IOException {
 
        List<Autor> autor = autorService.findAllAutors();
                
        model.addAttribute("autor", autor);
        model.addAttribute("loggedinuser", getPrincipal());
        return "autor-list";
    }
    
    @RequestMapping(value = { "/autor-agregar" }, method = RequestMethod.GET)
    public String newAutor(ModelMap model) {
        Autor autor = new Autor();
        model.addAttribute("autor", autor);
        model.addAttribute("edit", false);
        model.addAttribute("loggedinuser", getPrincipal());
      
        return "autor-reg";
    }
    
    @RequestMapping(value = { "/autor-agregar" }, method = RequestMethod.POST)
    public String saveAutor(@Valid Autor autor, BindingResult result,
            ModelMap model) throws IOException {
 
    	if (result.hasErrors()) {
            return "autor-reg";
        }
                 	  	
    	autorService.saveAutor(autor);
        //model.addAttribute("success", "Autor: <strong>" + autor.getNombreautor() + "</strong> Registrado");
        model.addAttribute("loggedinuser", getPrincipal());
        //return "success";
        //return "autor-reg-succ";
        return "redirect:/autor-agregar";
    }
    
    @RequestMapping(value = { "/edit-autor-{codigoautor}" }, method = RequestMethod.GET)
    public String editAutor(@PathVariable Integer codigoautor, ModelMap model) {
    	Autor autor = autorService.findById(codigoautor);
    	model.addAttribute("autor", autor);
        model.addAttribute("edit", true);
        model.addAttribute("loggedinuser", getPrincipal());
        return "autor-reg";
    }
 
    @RequestMapping(value = { "/edit-autor-{codigoautor}" }, method = RequestMethod.POST)
    public String updateArea(@Valid Autor autor, BindingResult result,
            ModelMap model, @PathVariable Integer codigoautor) throws IOException {
 
        if (result.hasErrors()) {
            return "autor-reg";
        }
 
        autorService.updateAutor(autor);
        //model.addAttribute("success", "Autor: <strong>" + autor.getNombreautor()+"</strong> Se ha Actualizado ");
        model.addAttribute("loggedinuser", getPrincipal());
        //return "autor-reg-succ";
        return "redirect:/autor-list";
    }
    
    @RequestMapping(value = { "/delete-autor-{codigoautor}" }, method = RequestMethod.GET)
    public String deleteAutor(@PathVariable Integer codigoautor) {
    	
    	autorService.deleteAutorById(codigoautor);
        return "redirect:/autor-list";
    }
    
    @RequestMapping(value = { "/estado-borrar-autor-{codigoautor}" }, method = RequestMethod.GET)
    public String updateAutorDeleted(@PathVariable Integer codigoautor) {    	
    	autorService.estadoBorrarAutorById(codigoautor);
        return "redirect:/autor-list";
    }
    
    //*************************************************************************
    // ***************** CONTROLES DE EDITORIALES *****************************
    //*************************************************************************
    
    @RequestMapping(value = { "/editorial-list" }, method = RequestMethod.GET)
    public String listEditoriales(ModelMap model) throws IOException {
        List<Editorial> editoriales = editorialService.findAllEditoriales();
        model.addAttribute("editoriales", editoriales);
        model.addAttribute("loggedinuser", getPrincipal());
        return "editorial-list";
    }
    
    @RequestMapping(value = { "/editorial-agregar" }, method = RequestMethod.GET)
    public String newEditorial(ModelMap model) {
        Editorial editorial = new Editorial();
        model.addAttribute("editorial", editorial);
        model.addAttribute("edit", false);
        model.addAttribute("loggedinuser", getPrincipal());
        return "editorial-reg";
    }
    
    @RequestMapping(value = { "/editorial-agregar" }, method = RequestMethod.POST)
    public String saveEditorial(@Valid Editorial editorial, BindingResult result,
            ModelMap model) throws IOException {
 
    	if (result.hasErrors()) {
            return "editorial-reg";
        }
             	
    	editorialService.saveEditorial(editorial);
    	
        //model.addAttribute("success", "Editorial: <strong>" + editorial.getNombre()+"</strong> Registrado");
        model.addAttribute("loggedinuser", getPrincipal());
        //return "success";
        return "redirect:/editorial-agregar";
    }
    
    @RequestMapping(value = { "/edit-editorial-{id}" }, method = RequestMethod.GET)
    public String editEditorial(@PathVariable Integer id, ModelMap model) {
    	Editorial editorial = editorialService.findById(id);
    	model.addAttribute("editorial", editorial);
        model.addAttribute("edit", true);
        model.addAttribute("loggedinuser", getPrincipal());
        return "editorial-reg";
    }
 
    @RequestMapping(value = { "/edit-editorial-{id}" }, method = RequestMethod.POST)
    public String updateEditorial(@Valid Editorial editorial, BindingResult result,
            ModelMap model, @PathVariable Integer id) throws IOException {
         if (result.hasErrors()) {
            return "editorial-reg";
        }
 
        editorialService.updateEditorial(editorial);
        //model.addAttribute("success", "Editorial: <strong>" + editorial.getNombre()+"</strong> Se ha Actualizado ");
        model.addAttribute("loggedinuser", getPrincipal());
        return "redirect:/editorial-list";
    }
    
    @RequestMapping(value = { "/delete-editorial-{codigoeditorial}" }, method = RequestMethod.GET)
    public String deleteEditorial(@PathVariable Integer codigoeditorial) {    	
    	editorialService.deleteEditorial(codigoeditorial);    	
        return "redirect:/editorial-list";
    }
    
    @RequestMapping(value = { "/estado-borrar-editorial-{codigoeditorial}" }, method = RequestMethod.GET)
    public String updateEditorialDeleted(@PathVariable Integer codigoeditorial) {    	
    	editorialService.estadoBorrarEditorialById(codigoeditorial);
        return "redirect:/editorial-list";
    }
    
    //*************************************************************************
    // *****************CONTROLES DE PROVEEDORES *******************************
    //*************************************************************************
    
    //METODO LISTAR PROVEEDORES
    @RequestMapping(value = { "/proveedor-list" }, method = RequestMethod.GET)
    public String listProveedores(ModelMap model) throws IOException {
        List<Proveedor> proveedores = proveedorService.findAllProveedores();
        model.addAttribute("proveedores", proveedores);
        model.addAttribute("loggedinuser", getPrincipal());
        return "proveedor-list";
    }
    
      
    //METODO DE AGREGAR PROVEEDORES MODO GET
    @RequestMapping(value = { "/proveedor-agregar" }, method = RequestMethod.GET)
    public String newProveedor(ModelMap model) {
       	Proveedor proveedor = new Proveedor();
        model.addAttribute("proveedor", proveedor);
        model.addAttribute("edit", false);
        model.addAttribute("loggedinuser", getPrincipal());
        return "proveedor-reg";
    }
    
    //METODO DE AGREGAR PROVEEDORES MODO POST
    @RequestMapping(value = { "/proveedor-agregar" }, method = RequestMethod.POST)
    public String saveProveedor(@Valid Proveedor proveedor, BindingResult result,
            ModelMap model) throws IOException {
 
    	if (result.hasErrors()) {
            return "proveedor-reg";
        }
             	
    	proveedorService.saveProveedor(proveedor);   	
 
        model.addAttribute("success", "Provedor: <strong>" + proveedor.getNombreproveedor()+" "+proveedor.getContactoproveedor1()+"</strong> Registrado");
        model.addAttribute("loggedinuser", getPrincipal());
        //return "success";
        return "proveedor-reg-succ";
    }
    
    //METODO DE ACTUALIZAR PROVEEDORES MODO GET
    @RequestMapping(value = { "/edit-proveedor-{codigoproveedor}" }, method = RequestMethod.GET)
    public String editProveedor(@PathVariable Integer codigoproveedor , ModelMap model) {	
    	Proveedor proveedor = proveedorService.findById(codigoproveedor);
    	model.addAttribute("proveedor", proveedor);
        model.addAttribute("edit", true);
        model.addAttribute("loggedinuser", getPrincipal());
        return "proveedor-reg";
    }
 
    //METODO DE ACTUALIZAR PROVEEDORES MODO POST
    @RequestMapping(value = { "/edit-proveedor-{codigoproveedor}" }, method = RequestMethod.POST)
    public String updateProveedor(@Valid Proveedor proveedor, BindingResult result,
            ModelMap model, @PathVariable Integer codigoproveedor) throws IOException {
 
        if (result.hasErrors()) {
            return "proveedor-reg";
        }
 
        proveedorService.updateProveedor(proveedor);
        //model.addAttribute("success", "Proveedor: <strong>" + proveedor.getNombreproveedor()+"</strong> Se ha Actualizado ");
        model.addAttribute("loggedinuser", getPrincipal());
        //return "proveedor-reg-succ";
        return "proveedor-reg";
        }

    //METODO DE ELIMINAR PROVEEDORES
    @RequestMapping(value = { "/delete-proveedor-{codigoproveedor}" }, method = RequestMethod.GET)
    public String deleteProveedor(@PathVariable Integer codigoproveedor) {
       	proveedorService.deleteProveedor(codigoproveedor);
        return "redirect:/proveedor-list";
    }
    
  //METODO DE CAMBIAR ESTADO DE LOS PROVEEDORES
    @RequestMapping(value = { "/proveedor-list-deleted" }, method = RequestMethod.GET)
        public String listProveedorDeleted(ModelMap model) throws IOException {
            List<Proveedor> proveedor = proveedorService.findAllProveedoresDeleted();                
            model.addAttribute("proveedor", proveedor);
           model.addAttribute("loggedinuser", getPrincipal());
            return "proveedor-list-deleted";
      } 
    
  //METODO DE OCULTAR PROVEEDORES
    @RequestMapping(value = { "/estado-borrar-proveedor-{codigoproveedor}" }, method = RequestMethod.GET)
        public String updateProveedorDeleted(@PathVariable Integer codigoproveedor) {    	
        	proveedorService.estadoBorrarProveedorById(codigoproveedor);
            return "redirect:/proveedor-list";
       }
     
  //METODO PARA RESTAURAR PROVEEDORES
    @RequestMapping(value = { "/estado-restaurar-proveedor-{codigoproveedor}" }, method = RequestMethod.GET)
        public String updateProveedorRestore(@PathVariable Integer codigoproveedor) {    	
        	proveedorService.estadoRestaurarProveedorById(codigoproveedor);
            return "redirect:/proveedor-list";
        }
      
  
    //*************************************************************************
    // *************CONTROLES DE CODIGO TIPO DE PRODUCTO***********************
    //*************************************************************************
    @RequestMapping(value = { "/tipo-list" }, method = RequestMethod.GET)
    public String listTipoProductos(ModelMap model) throws IOException {
 
        List<TipoProducto> tipo = tipoProductoService.findAllTipoProductos();
                
        model.addAttribute("tipo", tipo);
        model.addAttribute("loggedinuser", getPrincipal());
        return "tipo-list";
    }
    
    @RequestMapping(value = { "/tipo-agregar" }, method = RequestMethod.GET)
    public String newTipoProducto(ModelMap model) {
        TipoProducto tipo = new TipoProducto();
        model.addAttribute("tipo", tipo);
        model.addAttribute("edit", false);
        model.addAttribute("loggedinuser", getPrincipal());
        return "tipo-reg";
    }
    
    @RequestMapping(value = { "/tipo-agregar" }, method = RequestMethod.POST)
    public String saveTipoProducto(@Valid TipoProducto tipo, /*borrar@Valid Proveedor p, @Valid Area a borrar*/BindingResult result,
            ModelMap model) throws IOException {
 
    	if (result.hasErrors()) {
            return "tipo-reg";
        }
                 	  	
    	tipoProductoService.saveTipoProducto(tipo);
    	
        model.addAttribute("success", "TipoProducto: <strong>" + tipo.getTipoProducto() + "</strong> Registrado");
        model.addAttribute("loggedinuser", getPrincipal());
        return "tipo-reg-succ";
        
        /*
         * borrar : vaya ve que manejan en el model las varaibles: claro essto va en el metodo de guardar producto
         */
        //model.addAttribute("idproduto", p.getCodigoproveedor() + a.getCodigoarea() + "1");
         
    }
    
    @RequestMapping(value = { "/edit-tipo-{codTipoProducto}" }, method = RequestMethod.GET)
    public String editTipoProducto(@PathVariable Integer codTipoProducto, ModelMap model) {
    	
    	TipoProducto tipo = tipoProductoService.findByCodTipoProducto(codTipoProducto);
    	model.addAttribute("tipo", tipo);
        model.addAttribute("edit", true);
        model.addAttribute("loggedinuser", getPrincipal());
        return "tipo-reg";
    }
 
    @RequestMapping(value = { "/edit-tipo-{codTipoProducto}" }, method = RequestMethod.POST)
    public String updateTipoProducto(@Valid TipoProducto tipo, BindingResult result,
            ModelMap model, @PathVariable Integer codTipoProducto) throws IOException {
 
        if (result.hasErrors()) {
            return "tipo-reg";
        }
 
        tipoProductoService.updateTipoProducto(tipo);

        model.addAttribute("success", "TipoProducto: <strong>" + tipo.getTipoProducto()+"</strong> Se ha Actualizado ");
        model.addAttribute("loggedinuser", getPrincipal());
        return "tipo-reg-succ";
    }
    
    @RequestMapping(value = { "/delete-tipo-{codTipoProducto}" }, method = RequestMethod.GET)
    public String deleteTipoProducto(@PathVariable Integer codTipoProducto) {
    	
    	tipoProductoService.deleteTipoProductoByCodTipoProducto(codTipoProducto);
        return "redirect:/tipo-list";
    }
    

    //*************************************************************************
    // *****************CONTROLES DE PRODUCTO *********************************
    //*************************************************************************
    
    @RequestMapping(value = { "/producto-detalle-{codigoProducto}" }, method = RequestMethod.GET)
    public String detProductos(@PathVariable Integer codigoProducto, ModelMap model) throws IOException {
    	Producto producto = productoService.findByCodigoProducto(codigoProducto);
    	producto.setImg(byteToString(producto.getImagen()));
    	producto.setImgc(byteToString(producto.getImagenc()));
    	model.addAttribute("producto", producto);
    	
        return "producto-detalle";
    }   
    
    @RequestMapping(value = { "/producto-list" }, method = RequestMethod.GET)
    public String listProductos(ModelMap model) throws IOException {
    	
    	List<Producto> productos = productoService.findAllProductos();
    	for(Producto producto: productos){
    		producto.setImg(byteToString(producto.getImagen()));
    	}
    	
    	/*
    	for(Producto producto: productos){
    		producto.setImgc(byteToString(producto.getImagenc()));
    	}*/
    	
        model.addAttribute("productos", productos);
        model.addAttribute("loggedinuser", getPrincipal());
        return "producto-list";
    }
    
    @RequestMapping(value = { "/producto-agregar" }, method = RequestMethod.GET)
    public String newProducto(ModelMap model) {
        
        Producto producto= new Producto();
        model.addAttribute("producto", producto);
        model.addAttribute("edit", false);
        model.addAttribute("loggedinuser", getPrincipal());
        return "producto-reg";
    }
    
    @RequestMapping(value = { "/producto-agregar" }, method = RequestMethod.POST)
    public String saveProducto(@Valid Producto producto, BindingResult result,
            ModelMap model) throws IOException {
 
    	if (result.hasErrors()) {
            return "producto-reg";
        }
             	
    	System.out.println(producto.getEditorial());    	
    	byte[] file = readBytesFromFile("/home/vladimir/mytemp/" + producto.getLocation());
    	System.out.println("/home/vladimir/mytemp/"  +producto.getLocation());
    	producto.setImagen(file);
    	
    	byte[] filec = readBytesFromFile("/home/vladimir/mytemp/" + producto.getLocationc());
    	System.out.println("/home/vladimir/mytemp/"  +producto.getLocation());
    	producto.setImagenc(filec);
    	
    	productoService.saveProducto(producto);
    	model.addAttribute("success", "Producto: <strong>" + producto.getNombreProducto()+"</strong> Registrado");
        model.addAttribute("loggedinuser", getPrincipal());
        //return "success";
        return"producto-reg-succ";
        //return "redirect:/producto-agregar";
    }
    
    @RequestMapping(value = { "/edit-producto-{codigoProducto}" }, method = RequestMethod.GET)
    public String editProducto(@PathVariable Integer codigoProducto, ModelMap model) {
    	Producto producto = productoService.findByCodigoProducto(codigoProducto);
    	model.addAttribute("producto", producto);
        model.addAttribute("edit", true);
        model.addAttribute("loggedinuser", getPrincipal());
        return "producto-reg";
    }
 
    @RequestMapping(value = { "/edit-producto-{codigoProducto}" }, method = RequestMethod.POST)
    public String updateProducto(@Valid Producto producto, BindingResult result,
            ModelMap model, @PathVariable Integer codigoProducto) throws IOException {
 
        if (result.hasErrors()) {
            return "producto-reg";
        }
        
        if(producto.getLocation()!=""){
        	byte[] file = readBytesFromFile("/home/vladimir/mytemp/" + producto.getLocation());
        	System.out.println("/home/vladimir/mytemp/" + producto.getLocation());
        	producto.setImagen(file);
        }
        
        if(producto.getLocationc()!=""){
        	byte[] filec = readBytesFromFile("/home/vladimir/mytemp/" + producto.getLocationc());
        	System.out.println("/home/vladimir/mytemp/" + producto.getLocationc());
        	producto.setImagenc(filec);
        }
        
        productoService.updateProducto(producto);
        //model.addAttribute("success", "Producto: <strong>" + producto.getNombreProducto()+"</strong> Se ha Actualizado ");
        model.addAttribute("loggedinuser", getPrincipal());
        //return "producto-reg-succ";
        return "redirect:/producto-list";
    }
    
    @RequestMapping(value = { "/delete-producto-{codigoProducto}" }, method = RequestMethod.GET)
    public String deleteProducto(@PathVariable Integer codigoProducto) {
    	productoService.deleteByCodigoProducto(codigoProducto);
        return "redirect:/producto-list";
    }
    
    @InitBinder
    public void initBinder(WebDataBinder binder){
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, false));
    }
    
    @InitBinder  
    public void  myInitBinderMethod (WebDataBinder binder)  
     {  
       binder.registerCustomEditor(Editorial.class, new PropertyEditorSupport() {  
         @Override  
         public void setAsText(String text) {  
         	Editorial editorial = editorialService.findById(Integer.parseInt(text));
         	setValue(editorial); 
            }  
       });
       
       binder.registerCustomEditor(Area.class, new PropertyEditorSupport() {  
           @Override  
           public void setAsText(String text) {  
           	Area areas = areaService.findById(Integer.parseInt(text));
           	setValue(areas); 
              }  
         });
       
       binder.registerCustomEditor(Autor.class, new PropertyEditorSupport() {  
           @Override  
           public void setAsText(String text) {  
           	Autor autores = autorService.findById(Integer.parseInt(text));
           	setValue(autores); 
              }  
         });
       
       binder.registerCustomEditor(Proveedor.class, new PropertyEditorSupport() {  
           @Override  
           public void setAsText(String text) {  
           	Proveedor proveedores = proveedorService.findById(Integer.parseInt(text));
           	setValue(proveedores); 
              }  
         });
       
       binder.registerCustomEditor(TipoProducto.class, new PropertyEditorSupport() {  
           @Override  
           public void setAsText(String text) {  
           	TipoProducto tipos = tipoProductoService.findByCodTipoProducto(Integer.parseInt(text));
           	setValue(tipos); 
              }  
         });
     }
    

     //*************************************************************************
    // ***************** CONTROLES DE RETACEO**********************************
    //*************************************************************************
    
    @RequestMapping(value = { "/detalleretaceo-list" }, method = RequestMethod.GET)
    public String listRetaceos(ModelMap model) throws IOException {
    	
    	
    	 List<Retaceo> retaceo = retaceoService.findAllRetaceos();//extrae todos los retaceos
    	 
            
         model.addAttribute("retaceo", retaceo);
       
        model.addAttribute("loggedinuser", getPrincipal());
        return "detalleretaceo-list";
    }
    
    @RequestMapping(value = { "/detalleretaceo-agregar" }, method = RequestMethod.GET)
    public String newdetalleRetaceo( HttpServletRequest request,ModelMap model) {
        DetalleRetaceo detalleretaceo = new DetalleRetaceo();
        model.addAttribute("detalleretaceo", detalleretaceo);
        model.addAttribute("edit", false);
        model.addAttribute("loggedinuser", getPrincipal());
    	HttpSession sesion=request.getSession(true);
    	  // populate
    	HttpSession session = request.getSession();
    	HttpSession sesion2=request.getSession(true);
    	
    	Producto producto=new Producto();
    	Double total=0.0;
    	
    	  //se obtiene el ultimo codigo retaceo    
    	
    	/*if(retaceoService.findAllRetaceos().isEmpty()){
    		
    		Retaceo retaceo=new Retaceo();
    		
    	}
        */
    			List<Retaceo> retaceo5 = retaceoService.findAllRetaceos();
    			
    	Integer codigoretaceo = retaceo5.get(retaceo5.size()-1).getCodigoretaceo();
        HttpSession sesion1=request.getSession(true);
        sesion1.setAttribute("codigo", codigoretaceo);   
    	//!detalleretaceoService.findRetaceos(codigoretaceo).isEmpty()
    //	if(sesion.getAttribute("codigo")!=null)
    		if(!detalleretaceoService.findRetaceos(codigoretaceo).isEmpty())	
    	{
    	  Integer codigo=(Integer) sesion.getAttribute("codigo");
    	  List<DetalleRetaceo> retaceoBuscar = detalleretaceoService.findRetaceos(codigo);  
    	  Retaceo retaceo= retaceoService.findById(codigo);				    	 
	      Date fechafacturaproveedor=retaceo.getFechafacturaproveedor();
	      Integer codigofacturaproveedor=retaceo.getCodigofacturaproveedor();
	      Date fecharetaceo=retaceo.getFecharetaceo();	
	      Integer codigoproveedor=retaceo.getCodigoproveedor();			
    	  Double utilidad=retaceoBuscar.get(retaceoBuscar.size()-1).getUtilidad();
	     // Double utilidad=retaceo5.get(retaceo5.size()-1).getUtilidad();
	      Integer codigodetalleretaceo=retaceoBuscar.get(0).getCodigodetalleretaceo();
    	 
    	  for (int i = 0; i < retaceoBuscar.size(); i++){
    		   total=total+retaceoBuscar.get(i).getSubtotal(); //aqui se calcula el total
    		  
    	  }    	  
    	 
    	  
    	  System.out.println("revisar:----------------------------------------------------------------------------" + retaceoBuscar.size());
    	  model.addAttribute("total", total);
    	  sesion2.setAttribute("total", total);// Se utilizara para almacenarlo en tabla retaceo
    	  model.addAttribute("retaceo2", retaceoBuscar);
    	  
    	  
    	   SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");//este es el formato que agarra el navegador
	    	String fecha = sdf.format(fecharetaceo);
	    	String fechafac = sdf.format(fechafacturaproveedor);
	    	
	    	 Proveedor proveedoresBuscar = proveedorService.findById(codigoproveedor);//Revisar
	    	  String nombreproveedor=proveedoresBuscar.getNombreproveedor();//Revisar
	    		
	    	  model.addAttribute("guarde", 1);
	    	  model.addAttribute("codigoretaceo",codigoretaceo );
    	  model.addAttribute("fecharetaceo",fecha );
	    	model.addAttribute("fechafacturaproveedor",fechafac );
	    	model.addAttribute("utilidad", utilidad);			    	
	    	model.addAttribute("codigoproveedor", codigoproveedor);			    	
	    	model.addAttribute("nombreproveedor", nombreproveedor);
	    	model.addAttribute("codigofacturaproveedor", codigofacturaproveedor);
       }
    	
    	 
   	  else{   	
				    
				    Date fechafacturaproveedor= new Date();
				      Integer codigofacturaproveedor=0;
				      Date fecharetaceo=new Date();	
				      Integer codigoproveedor=0;			
			    	  //Double utilidad=20.0;
			    	  Double utilidad=retaceo5.get(retaceo5.size()-1).getUtilidad();
				    
			    	  SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");//este es el formato que agarra el navegador
				    	String fecha = sdf.format(fecharetaceo);
				    	String fechafac = sdf.format(fechafacturaproveedor);
				    	
				    	
				    	 model.addAttribute("codigoretaceo",codigoretaceo );
				    	  model.addAttribute("fecharetaceo",fecha );
					    	model.addAttribute("fechafacturaproveedor",fechafac );
					    	model.addAttribute("utilidad", utilidad);			    	
					    	model.addAttribute("codigoproveedor", 0);			    	
					    	model.addAttribute("nombreproveedor", " ");
					    	model.addAttribute("codigofacturaproveedor", codigofacturaproveedor);
					    	 model.addAttribute("total", 0.0);
   	  
   	     }
   		     
        List<Proveedor> proveedores = proveedorService.findAllProveedores();
        List<Producto> productos = productoService.findAllProductos();     
        model.addAttribute("proveedor", proveedores);
        model.addAttribute("producto", productos);
      
        return "detalleretaceo-reg";
  }
    
    @RequestMapping(value = { "/detalleretaceo-agregar" }, method = RequestMethod.POST)   
    public String saveRetaceo( HttpServletRequest request,@Valid DetalleRetaceo detalleretaceo, BindingResult result,
                              ModelMap model,@RequestParam(required = false) String fecharetaceo,
                              @RequestParam(required = false) String fechafacturaproveedor
                              ,@RequestParam(required = false) String codigofacturaproveedor) 
    		throws IOException, ParseException {
         	/*
                String idPagoAsignado = request.getParameter("idPagoAsignado");
                String idReversoAsignado = request.getParameter("idReversoAsignado");    
    	  */
 
          HttpSession sesion2=request.getSession(true);
  	
    	if (result.hasErrors()) {
            return "detalleretaceo-reg";
        }
    	detalleretaceoService.savedetalleRetaceo(detalleretaceo);
		
    	/*Integer codigoretaceo = Integer.parseInt(request.getParameter("codigoretaceo"));
    	Integer codigoproveedor = Integer.parseInt(request.getParameter("codigoproveedor"));
    	Integer codigofacturaproveedor = Integer.parseInt(request.getParameter("codigofacturaproveedor"));*/
    	
    	Integer codigoretaceo = Integer.parseInt(request.getParameter("codigoretaceo"));
    	System.out.println("revisar:----------------------------------------------------------------------------");
    	
    	
    	
    	Integer codigoproveedor = Integer.parseInt(request.getParameter("codigoproveedor"));
    	
    	Integer codigofacturaproveedor1 =Integer.parseInt(codigofacturaproveedor);
    	Date fecharetaceo1 = new SimpleDateFormat("yyyy-MM-dd").parse(fecharetaceo);
    	Date fechafacturaproveedor1=new SimpleDateFormat("yyyy-MM-dd").parse(fechafacturaproveedor);
    	SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");///formateo en String
    	String fecha = sdf.format(fecharetaceo1);
    	String fecha1 = sdf.format(fechafacturaproveedor1);
    	String nombreproveedor = request.getParameter("nombreproveedor");
    	//Integer utilidad = Integer.parseInt(request.getParameter("utilidad"));
        String revisar=nombreproveedor;
    	
        
        HttpSession sesion = request.getSession();
       // Double total=(Double)sesion.getAttribute("total");
        Double total=0.0;
       // if(total==0.0){
        	
        	
          Integer codigo=(Integer) sesion.getAttribute("codigo");
       	  List<DetalleRetaceo> retaceoBuscar = detalleretaceoService.findRetaceos(codigo);  
       	 
       	  for (int i = 0; i < retaceoBuscar.size(); i++){
       		   total=total+retaceoBuscar.get(i).getSubtotal(); //aqui se calcula el total
       		  
       	  } 
       // }
    	
        System.out.println("total:----------------------------------------------------------------------------"+total);
    	
    	retaceoService.updateFechaRetaceo(fecharetaceo1,fechafacturaproveedor1,codigoproveedor,codigofacturaproveedor1, codigoretaceo,total);
    	
    	
    	sesion2.setAttribute("codigofacturaproveedor", codigofacturaproveedor1);
    	sesion2.setAttribute("codigoproveedor", codigoproveedor);//para utilizarlo en finalizar retaceo
    	//sesion2.setAttribute("nombreproveedor", nombreproveedor);
 		sesion2.setAttribute("fecharetaceo", fecha);//se almacena la fecha para utilizarlo en finalizar retaceo
 		sesion2.setAttribute("fechafacturaproveedor", fecha1);//se almacena la fecha de factura para utilizarlo en finalizar retaceo		
 		
 		
 		 

    	model.addAttribute("loggedinuser", getPrincipal());

         return "redirect:/detalleretaceo-agregar";
      //  return "detalleretaceo-reg";
      
       // return "retaceo-reg-succ";
    }
    
        
    @RequestMapping(value = { "/edit-detalleRetaceo-{codigoretaceo}" }, method = RequestMethod.GET)
    public String editdetalleRetaceo(@PathVariable Integer codigoretaceo, ModelMap model,HttpServletRequest request) throws IOException, ParseException{

    	
			    	//DetalleRetaceo detalleretaceo = new DetalleRetaceo();	
				      DetalleRetaceo detalleretaceo = new DetalleRetaceo();
				      model.addAttribute("detalleretaceo", detalleretaceo);
    	              HttpSession sesion = request.getSession();
    	              sesion.setAttribute("codigo", codigoretaceo); 
			    	  Producto producto=new Producto();		
			    	  Double total=0.0;	   
			    	 // List<DetalleRetaceo> retaceoBuscar = detalleretaceoService.findRetaceosProducto(codigoretaceo, codigoproducto);//Obtener la lista	
			    	 
			    	  
			    	  
			    	  if(!detalleretaceoService.findRetaceos(codigoretaceo).isEmpty()){
			    	  
			    	  List<DetalleRetaceo> retaceoBuscar = detalleretaceoService.findRetaceos(codigoretaceo); 
			    	  List<Proveedor> proveedores = proveedorService.findAllProveedores();				    	  
				      List<Producto> productos = productoService.findAllProductos();
				      
				      				      
				      Retaceo retaceo= retaceoService.findById(codigoretaceo);				    	 
				      Date fechafacturaproveedor=retaceo.getFechafacturaproveedor();
				      Integer codigofacturaproveedor=retaceo.getCodigofacturaproveedor();
				      Date fecharetaceo=retaceo.getFecharetaceo();	
				      Integer codigoproveedor=retaceo.getCodigoproveedor();			
			    	  Double utilidad=retaceoBuscar.get(0).getUtilidad();
			    	  Integer codigodetalleretaceo=retaceoBuscar.get(0).getCodigodetalleretaceo();
			    	 
			          DetalleRetaceo detalleretaceo1 = detalleretaceoService.findById(codigodetalleretaceo);
					  
			    	  
			    	  Proveedor proveedoresBuscar = proveedorService.findById(codigoproveedor);//revisar
			    	  String nombreproveedor=proveedoresBuscar.getNombreproveedor();//revisar
			    		
			    		
			    	 /*  Producto productoBuscar=productoService.findByCorrelativo(codigoproducto);
			    	   String nombreproducto=productoBuscar.getNombreProducto();
			    	   Integer existencia=productoBuscar.getExistencia();
			    	   Double costo=productoBuscar.getCostounitario();*/
			    				    		
			    	  sesion.setAttribute("punto", retaceoBuscar.size()-1);//ALAMACENA DESDE DONDE TIENE QUE EMPEZAR EL RETACEO NUEVO
			    	 
			    	  Integer d=retaceoBuscar.get(retaceoBuscar.size()-1).getCodigodetalleretaceo();
			    	//  System.out.println("codigo detalle:----------------------------------------------------------------------------"+d);
			    	  
			    	  
			    	  for (int i = 0; i < retaceoBuscar.size(); i++){
			    		   total=total+retaceoBuscar.get(i).getSubtotal(); //aqui se calcula el total			    		  
			    		   
			    	  }    	  
			    	 		    	 		       
			
			        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");//este es el formato que agarra el navegador
			    	String fecha = sdf.format(fecharetaceo);
			    	String fechafac = sdf.format(fechafacturaproveedor);
			    	
			    	model.addAttribute("detalleretaceo", detalleretaceo);	
			    	model.addAttribute("codigoretaceo",codigoretaceo );
			    	model.addAttribute("fecharetaceo",fecha );
			    	model.addAttribute("fechafacturaproveedor",fechafac );
			    	model.addAttribute("utilidad", utilidad);			    	
			    	model.addAttribute("codigoproveedor", codigoproveedor);			    	
			    	model.addAttribute("nombreproveedor", nombreproveedor);
			    	model.addAttribute("codigofacturaproveedor", codigofacturaproveedor);	
			    	//model.addAttribute("codigoproducto",codigoproducto );
			    	//model.addAttribute("nombreproducto", nombreproducto);
			        //model.addAttribute("existencia", existencia);
			    	//model.addAttribute("costo", costo);
			    			    	
			    	model.addAttribute("proveedor", proveedores);
				    model.addAttribute("producto", productos);
				    model.addAttribute("total", total);
			    	model.addAttribute("retaceo2", retaceoBuscar);	
			        model.addAttribute("edit", true);
			        model.addAttribute("loggedinuser", getPrincipal());				        		        
			        
			        sesion.setAttribute("codigofacturaproveedor", codigofacturaproveedor);
			    	sesion.setAttribute("codigoproveedor", codigoproveedor);//para utilizarlo en finalizar retaceo
			    	sesion.setAttribute("codigo", codigoretaceo);
			 		sesion.setAttribute("fecharetaceo", fecha);//se almacena la fecha para utilizarlo en finalizar retaceo
			 		sesion.setAttribute("fechafacturaproveedor", fechafac);//se almacena la fecha de factura para utilizarlo en finalizar retaceo		
			 		sesion.setAttribute("total", total);
			        
			        //System.out.println("codigodetalleretaceo:-----------------------------------------------------------" + codigodetalleretaceo);			        
			        return "detalleretaceo-modificar";
			        
				      }
				      return "redirect:/detalleretaceo-list";
				           
				      
              
    }
    
     
    @RequestMapping(value = { "/edit-detalleRetaceo-{codigoretaceo}" }, method = RequestMethod.POST)
    public String updateRetaceo(@Valid DetalleRetaceo detalleRetaceo, BindingResult result,
            ModelMap model, @PathVariable Integer codigoretaceo,HttpServletRequest request)
            		throws IOException, ParseException {
 
        if (result.hasErrors()) {
            return "detalleretaceo-reg";
        }
        
        
        HttpSession sesion = request.getSession();
        Integer punto=(Integer)sesion.getAttribute("punto");
              
      //  System.out.println("codigo:-----------------------------------" + detalleRetaceo.getCodigodetalleretaceo());	
        
        detalleretaceoService.savedetalleRetaceo(detalleRetaceo);
        
       // detalleretaceoService.updatedetalleRetaceo(detalleRetaceo);
       // model.addAttribute("success", "retaceo: <strong>" + detalleRetaceo.getCodigoretaceo()+"</strong> Se ha Actualizado ");
        model.addAttribute("loggedinuser", getPrincipal());
        
       // return "redirect:/detalleretaceo-list";
       // return "detalleretaceo-modificar";
        return "redirect:/edit-detalleRetaceo-{codigoretaceo}";
    }
    
    
    
    @RequestMapping(value = { "/delete-detalleRetaceo-{codigoretaceo}" }, method = RequestMethod.GET)
    public String deleteRetaceo(@PathVariable Integer codigoretaceo) {
    	
    	
    	
    	int codigodetalleretaceo=0; 
    	detalleretaceoService.deleteRetaceoById(codigoretaceo);
    	
    
    	
    	return "redirect:/detalleretaceo-agregar";
        //return "redirect:/detalleretaceo-list";
    }
    
    
    ////borra totalmente el retaceo
    @RequestMapping(value = { "/delete-detalleRetaceoTotal-{codigoretaceo}" }, method = RequestMethod.GET)
    public String deleteRetaceoTotal(@PathVariable Integer codigoretaceo) {
    	
    	///codigo retaceo
    	
    	int codigodetalleretaceo=0;

    	int codigoproducto=0;    	
         	
    	 List<DetalleRetaceo> retaceoBuscar = detalleretaceoService.findRetaceos(codigoretaceo); 
    	 
    	 retaceoBuscar.size();
    	// codigoretaceototal= retaceoBuscar.get(0).getCodigodetalleretaceo();
    	 
    	  for (int i = 0; i < retaceoBuscar.size(); i++){   		
    		  
    		  codigodetalleretaceo= retaceoBuscar.get(i).getCodigodetalleretaceo(); 
    		  codigoproducto=retaceoBuscar.get(i).getCodigoproducto();
    		  
    		  DetalleRetaceo detalle=detalleretaceoService.findById(codigodetalleretaceo);           
    	        
    	         
              Integer existenciaanterior =detalle.getExistenciaanterior();  // 
         	  Double costoanterior =detalle.getCostounitarioanterior(); // 
         	  Integer cantidad =detalle.getCantidadproducto();//producto de entrada   
         	
         	  Integer existencia =existenciaanterior;
         	
         	  Double utilidad=detalle.getUtilidad();
         	  utilidad=utilidad/100;
         	  Double precio=detalle.getPrecioproducto() ;
         	  Double costo=detalle.getCostoproducto();	///  costo  de producto entrada tabla retaceo   3
         	  costo=costoanterior;	/// calcula y actualiza total costo   (12*2.4) + (3*2) 
         
          Producto producto= productoService.findByCorrelativo(codigoproducto);
    	  
     	 precio=costo+(costo*utilidad);
    	  Integer cantidadetiquetar=producto.getCantidadetiquetar()-cantidad;
    	  
    	Integer marcado=0;
    	
    	 Integer prueba=producto.getExistencia()-cantidad;///existencia total -cantidad a eliminar
      	if(prueba>0){
      	  costo=detalle.getCostounitarioanterior();
      	}
      	
       else{
   		  cantidadetiquetar=0;
   		  costo=0.0;
   		  precio=0.0;
   	      }
           
    	  
    	  if(cantidadetiquetar>0){
    		  marcado=1;
    	  }
    	  else{
    		  cantidadetiquetar=0;  		  
    	  }    	  
    	  System.out.println("codigoproducto:-----------------------------------------------------------" + codigoproducto);			        
	       
    	  
    	  Integer sala=producto.getSala();
		  	
		  	if(sala>0){///existencia en sala
		  		
		  		existencia=existencia-sala;//existencia solo en bodega
		  		costo=detalle.getCostounitarioanterior();//costo de existencia en sala
		  		precio=detalle.getPrecioanterior();
			}
	
    	  
       	  productoService.updateprecioProducto(codigoproducto, precio, costo,existencia,cantidadetiquetar,marcado);       	 
    		  detalleretaceoService.deleteRetaceoById(codigodetalleretaceo);//borra retaceo hija   		   
   	  }   	
    	
    	  retaceoService.deleteRetaceoById(codigoretaceo);//borra retaceo padre
    	  
    	//return "redirect:/detalleretaceo-agregar";
        return "redirect:/detalleretaceo-list";
    }
    
    
    
    @RequestMapping(value = { "/finalizar" }, method = RequestMethod.GET)
    public String findetalleRetaceo( HttpServletRequest request,ModelMap model)throws IOException, ParseException {
    	
		    	/*
				Aqu� se detallan las siglas de las variables utilizadas en el c�lculo: 
		
						Cantidad de Productos en existencia = PEX 
						Cantidad de Productos de entrada = PE 
						Costo Productos en Existencia = CPEX
						Costo Productos de entrada = CPE
						Costo Promedio Unitario = CPU
						Precio de Venta = PV 
						Total de Costo = TC
						Total de Art�culos = TA  
						precio de venta anterior=PVA										
						La f�rmula para el c�lculo del costo promedio es la siguiente: 										 
						TC = (PEX*CPEX) +(PE*CPE) 
						TA = PEX+PE 
		                CPU=TC/TA 
						PV=CPU+(CPU*0.20). 									
				*/

          HttpSession sesion=request.getSession(true);
          Integer codigoretaceo=(Integer) sesion.getAttribute("codigo");
          sesion.setAttribute("codigoultimo", codigoretaceo);//para los reportes
          List<DetalleRetaceo> retaceoBuscar = detalleretaceoService.findRetaceos(codigoretaceo);
          for(int i=0;i<retaceoBuscar.size();i++){
        	  Integer codigoproducto =retaceoBuscar.get(i).getCodigoproducto();
        	  Producto producto= productoService.findByCorrelativo(codigoproducto);
   	          Integer sala=producto.getSala();
        	  Integer existenciaanterior =retaceoBuscar.get(i).getExistenciaanterior();  //  12
        	  Double costoanterior =retaceoBuscar.get(i).getCostounitarioanterior(); // 2.4
        	  Integer cantidad =retaceoBuscar.get(i).getCantidadproducto();//producto de entrada   // 2
        	  
        	  
        	  Integer existencia =existenciaanterior+cantidad;// calculo existencia completa
        	  Integer existenciatotal =existencia;
        	  existencia=existencia-sala;//para actualizar sala
        	  if(existencia<0){
        		  
        		  
        		  existencia=existencia*-1;
        	  }
        	  
        	  Double utilidad=retaceoBuscar.get(i).getUtilidad();
        	  utilidad=utilidad/100;
        	  Double precio=retaceoBuscar.get(i).getPrecioproducto() ;
        	  Double costo=retaceoBuscar.get(i).getCostoproducto();	///  costo  de producto entrada tabla retaceo   3
        	  costo=(existenciaanterior*costoanterior)+(costo*cantidad);	/// calcula y actualiza total costo   (12*2.4) + (3*2) 
        	  
        	  costo=costo/existenciatotal;
        	    	 
        	  Integer cantidadetiquetar=cantidad+producto.getCantidadetiquetar();
        	  Integer marcado=1;
        	          	  
        	  productoService.updateprecioProducto(codigoproducto, precio, costo,existencia,cantidadetiquetar,marcado);
        	 
          }
          
          //Integer retaceo6 = retaceo5.get(retaceo5.size()-1).getCodigoretaceo();
         // retaceoBuscar.get(arg0);
         // sesion.setAttribute("mySessionAttribute", fecha)
          
          Integer codigoproveedor=(Integer) sesion.getAttribute("codigoproveedor");
          Integer codigofacturaproveedor=(Integer) sesion.getAttribute("codigofacturaproveedor");
          String fecharetaceo=(String) sesion.getAttribute("fecharetaceo");
          String fechafacturaproveedor=(String) sesion.getAttribute("fechafacturaproveedor");
          
          //System.out.println("fecha--------------------------------------:" + fechafacturaproveedor);	
          
          Date fecharetaceo1 = new SimpleDateFormat("yyyy-MM-dd").parse(fecharetaceo);
          Date fechafacturaproveedor1 = new SimpleDateFormat("yyyy-MM-dd").parse(fechafacturaproveedor);
             
          double utilidad=retaceoService.findById(codigoretaceo).getUtilidad();
          
          Retaceo retaceo=new Retaceo();
          retaceo.setCodigoproveedor(codigoproveedor);
          retaceo.setCodigofacturaproveedor(codigofacturaproveedor);
          retaceo.setFecharetaceo(fecharetaceo1);
          retaceo.setFechafacturaproveedor(fechafacturaproveedor1);
          retaceo.setTotal(0.0);//inicializamos el total
          retaceo.setUtilidad(utilidad);
          
  		retaceoService.saveRetaceo(retaceo);//aqui incrementa el retaceo
  		
        Integer codigo=0;
		sesion.setAttribute("codigo", codigo);
		
    	return "GenerarReporteRetaceoFiltrado";////no tocar

    } 
    
    
    
    @RequestMapping(value = { "/finalizar-update" }, method = RequestMethod.GET)
    public String findetalleRetaceoUpdate( HttpServletRequest request,ModelMap model)throws IOException, ParseException {
    	
		    	/*
				Aqu� se detallan las siglas de las variables utilizadas en el c�lculo: 
		
						Cantidad de Productos en existencia = PEX 
						Cantidad de Productos de entrada = PE 
						Costo Productos en Existencia = CPEX
						Costo Productos de entrada = CPE
						Costo Promedio Unitario = CPU
						Precio de Venta = PV 
						Total de Costo = TC
						Total de Art�culos = TA  
						precio de venta anterior=PVA										
						La f�rmula para el c�lculo del costo promedio es la siguiente: 										 
						TC = (PEX*CPEX) +(PE*CPE) 
						TA = PEX+PE 
		                CPU=TC/TA 
						PV=CPU+(CPU*0.20). 						
														
				*/

          HttpSession sesion=request.getSession(true);
         //Integer codigoretaceo=(Integer) sesion.getAttribute("codigo");
         // sesion.setAttribute("codigoultimo", codigoretaceo);
          
          Integer punto=(Integer) sesion.getAttribute("punto");
          Integer codigoretaceo=(Integer) sesion.getAttribute("codigo");
          sesion.setAttribute("codigoultimo", codigoretaceo);
          System.out.println("revisar--------------------------------------codigo:"+ codigoretaceo);	
          
          List<DetalleRetaceo> retaceoBuscar = detalleretaceoService.findRetaceos(codigoretaceo);
          
          for(int i=punto;i<retaceoBuscar.size();i++){
        	  Integer codigoproducto =retaceoBuscar.get(i).getCodigoproducto();
        	  Integer existenciaanterior =retaceoBuscar.get(i).getExistenciaanterior();  //  12
        	  Double costoanterior =retaceoBuscar.get(i).getCostounitarioanterior(); // 2.4
        	  Integer cantidad =retaceoBuscar.get(i).getCantidadproducto();//producto de entrada   // 2
        	  Integer existencia =existenciaanterior+cantidad;// 12+2
        	  Double utilidad=retaceoBuscar.get(i).getUtilidad();
        	  utilidad=utilidad/100;
        	  Double precio=retaceoBuscar.get(i).getPrecioproducto() ;
        	  Double costo=retaceoBuscar.get(i).getCostoproducto();	///  costo  de producto entrada tabla retaceo   3
        	  costo=(existenciaanterior*costoanterior)+(costo*cantidad);	/// calcula y actualiza total costo   (12*2.4) + (3*2) 
        	  
        	  costo=costo/existencia;
        	  
        	  Producto producto= productoService.findByCorrelativo(codigoproducto);
        	  
         	 
        	  Integer cantidadetiquetar=cantidad+producto.getCantidadetiquetar();
        	  
        	  Integer marcado=1;
          	  
        	  productoService.updateprecioProducto(codigoproducto, precio, costo,existencia,cantidadetiquetar,marcado);
        	 
          }
          
         	
          Integer codigoproveedor=(Integer) sesion.getAttribute("codigoproveedor");
          Integer codigofacturaproveedor1=(Integer) sesion.getAttribute("codigofacturaproveedor");
          String fecharetaceo=(String) sesion.getAttribute("fecharetaceo");
          String fechafacturaproveedor=(String) sesion.getAttribute("fechafacturaproveedor");
          Double total=(Double) sesion.getAttribute("total");
          
          Date fecharetaceo1 = new SimpleDateFormat("yyyy-MM-dd").parse(fecharetaceo);
          Date fechafacturaproveedor1 = new SimpleDateFormat("yyyy-MM-dd").parse(fechafacturaproveedor);
          
          
          Retaceo retaceo=new Retaceo();
          retaceo.setCodigoproveedor(codigoproveedor);
          retaceo.setCodigofacturaproveedor(codigofacturaproveedor1);
          retaceo.setFecharetaceo(fecharetaceo1);
          retaceo.setFechafacturaproveedor(fechafacturaproveedor1);
          retaceo.setTotal(0.0);
          System.out.println("fecha--------------------------------------:" + fechafacturaproveedor);	
          
          retaceoService.updateFechaRetaceo(fecharetaceo1,fechafacturaproveedor1,codigoproveedor,codigofacturaproveedor1, codigoretaceo,total);
      
          
  		//retaceoService.saveRetaceo(retaceo);//aqui incrementa el retaceo
  		
        Integer codigo=0;
		sesion.setAttribute("codigo", codigo);
    		
		
    	return "GenerarReporteRetaceoFiltrado";////no tocar

    } 
    
    
    
    
    //////para eliminar de modificar retaceo
    
    @RequestMapping(value = { "/delete-detalleRetaceoupdate-{codigodetalleretaceo}-{codigoproducto}" }, method = RequestMethod.GET)

     public String deleteRetaceoUpdate( HttpServletRequest request,@PathVariable Integer codigodetalleretaceo,@PathVariable Integer codigoproducto) {
    	    	
  	      HttpSession sesion=request.getSession(true);
		          Integer codigoretaceo=(Integer) sesion.getAttribute("codigo");
		          // sesion.setAttribute("codigoultimo", codigoretaceo);		  	  
		 
           DetalleRetaceo detalle=detalleretaceoService.findById(codigodetalleretaceo);           
           
          Integer existenciaanterior =detalle.getExistenciaanterior();  // 
       	  Double costoanterior =detalle.getCostounitarioanterior(); // 
       	  Integer cantidad =detalle.getCantidadproducto();//producto de entrada   
       	
       	  Integer existencia =existenciaanterior;
       	
       	  Double utilidad=detalle.getUtilidad();
       	  utilidad=utilidad/100;
       	  Double precio=detalle.getPrecioproducto() ;
       	  Double costo=detalle.getCostoproducto();	///  costo  de producto entrada tabla retaceo   3
       	  costo=costoanterior;	/// calcula y actualiza total costo   (12*2.4) + (3*2) 
       
        Producto producto= productoService.findByCorrelativo(codigoproducto);
  	  
   	 precio=costo+(costo*utilidad);
  	  Integer cantidadetiquetar=producto.getCantidadetiquetar()-cantidad;
  	  
  	  Integer marcado=0;
  	
  	
  	 Integer prueba=producto.getExistencia()-cantidad;///existencia bodega -cantidad a eliminar
    	if(prueba>0){
    	  costo=detalle.getCostounitarioanterior();
    	}
    	
     else{
 		  cantidadetiquetar=0;
 		  costo=0.0;
 		  precio=0.0;
 	  }
         
  	  
  	  if(cantidadetiquetar>0){
  		  marcado=1;
  	  }
  	  else{
  		  cantidadetiquetar=0;  		  
  	  }
  	  
		Integer sala=producto.getSala();
		  	
		  	if(sala>0){///existencia en sala
		  		
		  		existencia=existencia-sala;//existencia solo en bodega
		  		costo=detalle.getCostounitarioanterior();//costo de existencia en sala
		  		precio=detalle.getPrecioanterior();
			}
  	
	  productoService.updateprecioProducto(codigoproducto, precio, costo,existencia,cantidadetiquetar,marcado);
	 
       	  detalleretaceoService.deleteRetaceoById(codigodetalleretaceo);    
    	
    	 if( detalleretaceoService.findRetaceos(codigoretaceo).isEmpty()){
    		 
    		 
    		 retaceoService.deleteRetaceoById(codigoretaceo);
    		 return "redirect:/detalleretaceo-list"; 
    	 }
       	  
    		//System.out.println("revisar--------------------------------------tamano:"+retaceoBuscar1.size());
       	  	
           return "redirect:/edit-detalleRetaceo-"+detalle.getCodigoretaceo();
          // return "detalleretaceo-modificar";
           
     } 

    
    
    
    @RequestMapping(value = { "/retaceo-detalle-{codigoretaceo}" }, method = RequestMethod.GET)
    public String listDetalleRetaceo(HttpServletRequest request,@PathVariable Integer codigoretaceo, ModelMap model) throws IOException {
       
    	Retaceo retaceo=retaceoService.findById(codigoretaceo);
    	model.addAttribute("retaceo", retaceo);
    	
    	  
                // Integer codigo1 = (Integer) sesion.getAttribute("codigoultimo");
          
          List<DetalleRetaceo> retaceoBuscar = detalleretaceoService.findRetaceos(codigoretaceo);
          model.addAttribute("detalleretaceo", retaceoBuscar); 
        
          HttpSession sesion=request.getSession(true);
          sesion.setAttribute("codigoultimo", codigoretaceo);
        
    	
    	
        
        return "retaceo-detalle";
    } 
    
    
    
   
    
    
    @RequestMapping(value = { "/edit-Parametro-Retaceo-{utilidad}" }, method = RequestMethod.GET)
    public String editParametroRetaceo( ModelMap model,HttpServletRequest request) throws IOException, ParseException{

    	
			    	
				     // Retaceo retaceo = new Retaceo();
				      
    	 List<Retaceo> retaceo=retaceoService.findAllRetaceos();
				    
    	 Integer codigoretaceo=retaceo.get(retaceo.size()-1).getCodigoretaceo();
				
    	 Retaceo retaceo1=retaceoService.findById(codigoretaceo);
    	 
    	 Double utilidad = retaceo1.getUtilidad();
				    
    	 
    	  model.addAttribute("utilidad", utilidad);
				      model.addAttribute("retaceo", retaceo1);
			    	  
			    	 
				      return "ParametrizarRetaceo";
				           
				      
              
    }
    
     
    @RequestMapping(value = { "/edit-Parametro-Retaceo-{utilidad}" }, method = RequestMethod.POST)
    public String updateParametroRetaceo(@Valid Retaceo retaceo, BindingResult result,
            ModelMap model,HttpServletRequest request)
            		throws IOException, ParseException {
 
        /*if (result.hasErrors()) {
            return "detalleretaceo-reg";
        }*/
        
        double utilidad=Double.parseDouble(request.getParameter("utilidad")) ;
    	
    	System.out.println("utilidad---------------------   "+utilidad);
    	//retaceo.setUtilidad(utilidad);
        
      retaceoService.updateRetaceo(retaceo,utilidad);
     
      
        
       // detalleretaceoService.updatedetalleRetaceo(detalleRetaceo);
       // model.addAttribute("success", "retaceo: <strong>" + detalleRetaceo.getCodigoretaceo()+"</strong> Se ha Actualizado ");
        model.addAttribute("loggedinuser", getPrincipal());
        
       // return "redirect:/detalleretaceo-list";
       // return "detalleretaceo-modificar";
      return "redirect:/edit-Parametro-Retaceo-"+utilidad;
    }
    
    
    
    
    
    
    
    //////////////////Finaliza Proceso de  RETACEO
    
    
    
    
    
    
    
    /********************************************************************************************************************************
     *********************************** CONTROLES PARA TRANSFERENCIAS***************************************************************
     *******************************************************************************************************************************/
    @RequestMapping(value = { "/transferencia-list" }, method = RequestMethod.GET)
    public String listTransferencia(ModelMap model) throws IOException {
        List<Transferencia> transferencias = transferenciaService.findAllTransferencias(); 
        model.addAttribute("transferencias", transferencias);
        model.addAttribute("loggedinuser", getPrincipal());
        return "transferencia-list";
    }
    
    @RequestMapping(value = { "/detalletransferencia-agregar" }, method = RequestMethod.GET)
    public String newdetalleTransferencia( HttpServletRequest request,ModelMap model) {
        DetalleTransferencia detalletransferencia = new DetalleTransferencia();
        model.addAttribute("detalletransferencia", detalletransferencia);
        model.addAttribute("edit", false);
        model.addAttribute("loggedinuser", getPrincipal());
        HttpSession sesion = request.getSession(true);
        
        List<Transferencia> transferencia5 = transferenciaService.findAllTransferencias();
        Integer transferencia6 = transferencia5.get(transferencia5.size()-1).getCodTransferencia();
        HttpSession sesion1 = request.getSession(true);
        sesion1.setAttribute("codigo1", transferencia6);
                
    	Double total = 0.0;
        if(sesion.getAttribute("codigo1") != null)
        {
          Integer codigo1 = (Integer) sesion.getAttribute("codigo1");
          List<DetalleTransferencia> transferenciaBuscar = detalletransferenciaService.findTransferencias(codigo1);
          
          for(int i = 0; i < transferenciaBuscar.size(); i++){
        	  total = total + transferenciaBuscar.get(i).getSubTotal();
          }
          model.addAttribute("total",total);
          model.addAttribute("transferencia2", transferenciaBuscar); 
        }
        
        // Controla la visualizacion del Boton Guardar Requisicion 
        if(!detalletransferenciaService.findTransferencias(transferencia6).isEmpty())	
    	{	
        	model.addAttribute("control6", 1);
    	}
        
        List<Producto> productos = productoService.findAllProductos();
        model.addAttribute("producto", productos);
        return "detalletransferencia-reg";
    }
    
    @RequestMapping(value = { "/detalletransferencia-agregar" }, method = RequestMethod.POST)   
    public String saveTransferencia( HttpServletRequest request,@Valid DetalleTransferencia detalletransferencia, BindingResult result, 
            ModelMap model,@RequestParam(required = false) String fechaTransferencia, @RequestParam(required=false)String numeroTransferencia,
            String tipoTransferencia, String sucursal, Boolean estado) throws IOException, ParseException {
            
    
        if (result.hasErrors()) {
            return "detalletransferencia-reg";
        }
        detalletransferenciaService.savedetalleTransferencia(detalletransferencia);
        
        Integer codTransferencia = Integer.parseInt(request.getParameter("codTransferencia"));
        //Integer numero = Integer.parseInt(request.getParameter("numeroTransferencia"));
        Integer numeroTransferencia1 = Integer.parseInt(numeroTransferencia);
        
        HttpSession sesion2 = request.getSession(true);
        Date fechaTransferencia1 = new SimpleDateFormat("yyyy-MM-dd").parse(fechaTransferencia);
        //transferenciaService.updateFechaTransferencia(fechaTransferencia1, codTransferencia, numeroTransferencia1, tipoTransferencia, sucursal, estado);
        sesion2.setAttribute("numeroTransferencia", numeroTransferencia1);
        SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
        String fecha = sdf.format(fechaTransferencia1);
        
        /*nuevo codigo*/
        HttpSession sesion = request.getSession();
        Double total = 0.0;
        
        Integer codigo1 = (Integer) sesion.getAttribute("codigo1");
        List<DetalleTransferencia> transferenciaBuscar = detalletransferenciaService.findTransferencias(codigo1);
        for(int i = 0; i < transferenciaBuscar.size(); i++){
        	total = total + transferenciaBuscar.get(i).getSubTotal();
        }
        
        transferenciaService.updateFechaTransferencia(fechaTransferencia1, codTransferencia, numeroTransferencia1, tipoTransferencia, sucursal, estado);
        /*Termina nuevo codigo*/
        
        sesion2.setAttribute("mySessionAttribute", fecha);
        model.addAttribute("loggedinuser", getPrincipal());

        return "redirect:/detalletransferencia-agregar";
      
    }
    
    @RequestMapping(value = { "/edit-detalleTransferencia-{codTransferencia}" }, method = RequestMethod.GET)
    public String editdetalleTransferencia(@PathVariable Integer codTransferencia, ModelMap model, HttpServletRequest request) throws IOException, ParseException{
    	
    	DetalleTransferencia detalletransferencia = new DetalleTransferencia();
    	model.addAttribute("detalletransferencia", detalletransferencia);
    	HttpSession sesion = request.getSession();
    	sesion.setAttribute("codTransferencia", codTransferencia);
    	Producto producto = new Producto();
    	Double total = 0.0;
    	
    	if(!detalletransferenciaService.findTransferencias(codTransferencia).isEmpty())
    	{
    		List<DetalleTransferencia> transferenciaBuscar = detalletransferenciaService.findTransferencias(codTransferencia);
    		List<Producto> productos = productoService.findAllProductos();
    		
    		Transferencia transferencia = transferenciaService.findById(codTransferencia);
    		Integer numeroTransferencia = transferencia.getNumeroTransferencia();
    		String tipoTransferencia = transferencia.getTipoTransferencia();
    		String sucursal = transferencia.getSucursal();
    		Date fechaTransferencia = transferencia.getFechaTransferencia();
    		Double utilidad = transferenciaBuscar.get(0).getUtilidad();
    		Integer codDetalleTransferencia = transferenciaBuscar.get(0).getCodDetalleTransferencia();
    		
    		DetalleTransferencia detalleTransferencia1 = detalletransferenciaService.findById(codDetalleTransferencia);
    		
    		sesion.setAttribute("punto", transferenciaBuscar.size()-1);
    		
    		Integer dato = transferenciaBuscar.get(transferenciaBuscar.size()-1).getCodDetalleTransferencia();
    		
    		for(int i = 0; i < transferenciaBuscar.size(); i++){
    			total = total + transferenciaBuscar.get(i).getSubTotal();
    		}
    		
    		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    		String fecha = sdf.format(fechaTransferencia);
    		
    		model.addAttribute("detalletransferencia", detalletransferencia);
    		model.addAttribute("codTransferencia", codTransferencia);
    		model.addAttribute("fechaTransferencia", fecha);
    		model.addAttribute("utilidad", utilidad);
    		model.addAttribute("numeroTransferencia", numeroTransferencia);
    		model.addAttribute("tipoTransferencia", tipoTransferencia);
    		model.addAttribute("sucursal", sucursal);
    		model.addAttribute("producto", productos);
    		model.addAttribute("total", total);
    		
    		model.addAttribute("transferencia2", transferenciaBuscar);
    		model.addAttribute("edit", true);
    		model.addAttribute("loggedinuser", getPrincipal());
    		
    		//para ser usado en finalizar
    		sesion.setAttribute("codigo1", codTransferencia);
    		sesion.setAttribute("numeroTransferencia", numeroTransferencia);
    		sesion.setAttribute("tipoTransferencia", tipoTransferencia);
    		sesion.setAttribute("sucursal", sucursal);
    		sesion.setAttribute("fechaTransferencia", fecha);
    		sesion.setAttribute("total", total);
    		
    		return "detalletransferencia-modificar";	
    	}
    	
    	return "redirect:/detalletransferencia-list";
    	
    }
    
    @RequestMapping(value = { "/transferencia-detalle-{codTransferencia}" }, method = RequestMethod.GET)
    public String listDetalleTransferencia(HttpServletRequest request,@PathVariable Integer codTransferencia, ModelMap model) throws IOException {
        Transferencia transferencia = transferenciaService.findById(codTransferencia);
        model.addAttribute("transferencia", transferencia);
        HttpSession sesion=request.getSession(true);
        sesion.setAttribute("codigoultimo", codTransferencia);
        
        if(sesion.getAttribute("codigoultimo") != null)
        {
          Integer codigo1 = (Integer) sesion.getAttribute("codigoultimo");
          List<DetalleTransferencia> transferenciaBuscar = detalletransferenciaService.findTransferencias(codigo1);          
          model.addAttribute("transferencia2", transferenciaBuscar); 
        }
        
        return "transferencia-detalle";
    } 
    
    /*
     @RequestMapping(value = { "/detalletransferencia-list" }, method = RequestMethod.GET)
    public String listTransferencias(ModelMap model) throws IOException {
        List<DetalleTransferencia> detalletransferencia = detalletransferenciaService.findAllTransferencias();
        model.addAttribute("detalletransferencia", detalletransferencia);
        model.addAttribute("loggedinuser", getPrincipal());
        return "detalletransferencia-list";
    }
     */
    
    
   @RequestMapping(value = { "/edit-detalleTransferencia-{codTransferencia}" }, method = RequestMethod.POST)
    public String updateTransferencias(@Valid DetalleTransferencia detalleTransferencia, BindingResult result,
        ModelMap model, @PathVariable Integer codTransferencia, HttpServletRequest request) throws IOException, ParseException {
 
        if (result.hasErrors()) {
            return "detalletransferencia-modificar";
        }
        
        HttpSession sesion = request.getSession();
        Integer punto = (Integer)sesion.getAttribute("punto");
 
        detalletransferenciaService.savedetalleTransferencia(detalleTransferencia);
        model.addAttribute("loggedinuser", getPrincipal());
        return "redirect:/edit-detalleTransferencia-{codTransferencia}";
    }
    
    @RequestMapping(value = { "/delete-detalleTransferencia-{codTransferencia}" }, method = RequestMethod.GET)
    public String deleteTransferencia(@PathVariable Integer codTransferencia) {
        detalletransferenciaService.deleteTransferenciaById(codTransferencia);
        return "redirect:/detalletransferencia-agregar";
    }
    
    @RequestMapping(value = { "/delete-transferencia-{codTransferencia}" }, method = RequestMethod.GET) // Eliminar una Transferencia de la tabla padre con sus hijas
    public String deleteTransferenciaMaestra(@PathVariable Integer codTransferencia) {    	
    	transferenciaService.updateEstadoTransferenciaById(codTransferencia);  	
        return "redirect:/transferencia-list";
    }
    
      
    @RequestMapping(value = { "/finalizar1" }, method = RequestMethod.GET)
    public String findetalleTransferencia( HttpServletRequest request,ModelMap model)throws IOException, ParseException {
        
          HttpSession sesion = request.getSession(true);
          Integer codTransferencia = (Integer) sesion.getAttribute("codigo1");
          sesion.setAttribute("codigoultimo", codTransferencia);
          //Leer valor a comparar, Salidas o Ingresos
          String tipoTransferencia = transferenciaService.findById(codTransferencia).getTipoTransferencia();
          
          Double total = 0.0;
          if(sesion.getAttribute("codigo1") != null)
          {
        	  Integer codigo1 =(Integer)sesion.getAttribute("codigo1");
        	  List<DetalleTransferencia> transferenciaBuscar = detalletransferenciaService.findTransferencias(codigo1);
        	  
        	  for(int i = 0; i < transferenciaBuscar.size(); i++){
        		  total = total + transferenciaBuscar.get(i).getSubTotal();
        	  }
          }
          
          transferenciaService.updateTotal(codTransferencia, total);
          
          List<DetalleTransferencia> transferenciaBuscar = detalletransferenciaService.findTransferencias(codTransferencia);
          
          for(int i=0;i<transferenciaBuscar.size();i++){
              Integer codProducto = transferenciaBuscar.get(i).getCodProducto();
              Integer existenciaAnterior = transferenciaBuscar.get(i).getExistenciaAnterior();
              Integer cantidad = transferenciaBuscar.get(i).getCantidadProducto();
              
              if (tipoTransferencia.equals("Ingresos")){
            	  Double precio = transferenciaBuscar.get(i).getPrecioProducto();
            	  Double costo = transferenciaBuscar.get(i).getCostoProducto();
            	  Double costoanterior = transferenciaBuscar.get(i).getCostoAnterior();
            	  Integer existencia = existenciaAnterior + cantidad;
            	  Double utilidad = transferenciaBuscar.get(i).getUtilidad();
            	  utilidad = utilidad/100;
            	  costo=(existenciaAnterior*costoanterior)+(costo*cantidad);
            	  costo = costo/existencia;
            	  //Double precio =retaceoBuscar.get(i).getPrecioproducto() ;
            	  productoService.updatePrecioProducto1(codProducto, precio, costo,existencia);
                  
              }
              else{
                  Integer existencia = existenciaAnterior - cantidad;
                  String Ubicacion="existencia";
                  productoService.updateExistencia1(codProducto, existencia,Ubicacion);
              }
             
          }
           
          String fecha = (String) sesion.getAttribute("mySessionAttribute");
          Date fechaTransferencia1 = new SimpleDateFormat("yyyy-MM-dd").parse(fecha);
          Transferencia transferencia = new Transferencia();
          //valores por defecto para inicializar la siguiente transferencoa
          transferencia.setTipoTransferencia("Salida");
          transferencia.setSucursal("San Salvador");
          transferencia.setNumeroTransferencia(0);
          //transferencia.setNumeroTransferencia(0);
          transferencia.setFechaTransferencia(fechaTransferencia1);
          transferencia.setTotal(0.0);
          transferencia.setEstado(true);
          transferenciaService.saveTransferencia(transferencia);
          Integer codigo1 = 0;
          sesion.setAttribute("codigo1", codigo1);
        
          return "redirect:/transferenciaUltima";
    }
    
    /**********************************************************************************************************************************************************************
     ********************************************************** Fin Transferencia *****************************************************************************************
     **********************************************************************************************************************************************************************/
    
  //***************************************************************************
    // ***************** CONTROLES PARA LOS REPORTES***************************
    //*************************************************************************
    //Controles para el Reporte de Retace de Producto
    @RequestMapping(value={"/reporte-retaceo"}, method = RequestMethod.GET)
	public String volumenEntrante(ModelMap model){
		model.addAttribute("loggedinuser", getPrincipal());
		return "GenerarReporteRetaceo";
	}
    
    
    
    @RequestMapping(value = { "/reporte-alcostoventa" }, method = RequestMethod.GET)
    public String AlCostoVenta(HttpServletRequest request, ModelMap model) throws IOException {
       
    	
    		model.addAttribute("loggedinuser", getPrincipal());
    		return "al-costo-venta";
    } 
    
    
    @RequestMapping(value={"/tralados"}, method = RequestMethod.GET)
	public String horashombre(ModelMap model){
		model.addAttribute("loggedinuser", getPrincipal());
		return "ReporteRetaceo";
	}
    
    
    @RequestMapping(value={"/al-costo-venta"}, method = RequestMethod.GET)
	public String horas(ModelMap model){
		model.addAttribute("loggedinuser", getPrincipal());
		return "ReporteRetaceo";
	}
    
    
    @RequestMapping(value={"/retaceo"}, method = RequestMethod.GET)
	public String reporteretaceoingreso(ModelMap model){
		model.addAttribute("loggedinuser", getPrincipal());
		return "ReporteRetaceoIngreso";
	}
    
        //Controles para el Reporte de Existencias de Producto
    @RequestMapping(value={"/existencias"}, method = RequestMethod.GET)
  	public String existencias(ModelMap model){
  		model.addAttribute("loggedinuser", getPrincipal());
  		return "GenerarReporteExistencias";
  	}
      
      @RequestMapping(value={"/repo_existencias"}, method = RequestMethod.GET)
  	public String repoexistencias(ModelMap model){
  		model.addAttribute("loggedinuser", getPrincipal());
  		return "ReporteExistencias";
  	}
      
    //Controles para el Reporte de Creditos
      @RequestMapping(value={"/facturas-creditos"}, method = RequestMethod.GET)
    	public String facturascreditos(ModelMap model){
    		model.addAttribute("loggedinuser", getPrincipal());
    		return "GenerarCreditos";
    	}
        
        @RequestMapping(value={"/repo_creditos"}, method = RequestMethod.GET)
    	public String repofacturascreditos(ModelMap model){
    		model.addAttribute("loggedinuser", getPrincipal());
    		return "ReporteCreditos";
    	}
        
     
      //Controles para el Reporte de Creditos Generales
        @RequestMapping(value={"/facturas-creditos-todos"}, method = RequestMethod.GET)
      	public String facturascreditostodos(ModelMap model){
      		model.addAttribute("loggedinuser", getPrincipal());
      		return "GenerarCreditosTodos";
      	}
          
          @RequestMapping(value={"/repo_creditos_todos"}, method = RequestMethod.GET)
      	public String repofacturascreditostodos(ModelMap model){
      		model.addAttribute("loggedinuser", getPrincipal());
      		return "ReporteCreditosTodos";
      	}
        
        

      //Controles para el Reporte de Transferencias a Sucursales
   @RequestMapping(value={"/transferencias"}, method = RequestMethod.GET)
 	public String trasnferencias(ModelMap model){
 		model.addAttribute("loggedinuser", getPrincipal());
 		return "GenerarReporteTransferencias";
 	}
     
  @RequestMapping(value={"/repo_transferencias"}, method = RequestMethod.GET)
 	public String repotrasnferencias(ModelMap model){
 		model.addAttribute("loggedinuser", getPrincipal());
 		return "ReporteTransferencias";
 	}

     //Control para el Reporte de requisicion
     @RequestMapping(value={"/repo_requisiciones"}, method = RequestMethod.GET)
 	public String repoteRequisicionIngreso(ModelMap model){
 		model.addAttribute("loggedinuser", getPrincipal());
 		return "ReporteRequisicionIngreso";
 	}
     
     //Controles para el Reporte de Kardex
     @RequestMapping(value={"/kardex"}, method = RequestMethod.GET)
   	public String kardex(ModelMap model){
   		model.addAttribute("loggedinuser", getPrincipal());
   		return "GenerarReporteKardex";
   	}
       
    @RequestMapping(value={"/repo_kardex"}, method = RequestMethod.GET)
   	public String repotkardex(ModelMap model){
   		model.addAttribute("loggedinuser", getPrincipal());
   		return "ReporteKardex";
   	}
    
    //Controles para la impresion de las facturas
    @RequestMapping(value={"/factura"}, method = RequestMethod.GET)
  	public String factura(ModelMap model){
  		model.addAttribute("loggedinuser", getPrincipal());
  		return "GenerarFactura";
  	}
      
   @RequestMapping(value={"/repo_factura"}, method = RequestMethod.GET)
  	public String repotfactura(ModelMap model){
  		model.addAttribute("loggedinuser", getPrincipal());
  		return "ReporteFactura";
  	}
   //----------------------------******************************* 
   //Controles para el Reporte de Facturas Emitidas
   @RequestMapping(value={"/facturas-emitidas"}, method = RequestMethod.GET)
 	public String facturasemitidas(ModelMap model){
 		model.addAttribute("loggedinuser", getPrincipal());
 		return "GenerarReporteFacturas";
 	}
     
     @RequestMapping(value={"/repo_facturas-emitidas"}, method = RequestMethod.GET)
 	public String repofacturasemitidas(ModelMap model){
 		model.addAttribute("loggedinuser", getPrincipal());
 		return "ReporteFacturasEmitidas";
 	}
   
 //Controles para generacion del reporte de la ultima transferencia insertada
   @RequestMapping(value={"/transferenciaUltima"}, method = RequestMethod.GET)
 	public String ultimaTransferencia(ModelMap model){
 		model.addAttribute("loggedinuser", getPrincipal());
 		return "GenerarUltimaTransferencia";
 	}
     
  @RequestMapping(value={"/repo_UltimaTransferencia"}, method = RequestMethod.GET)
 	public String repotTransferenciaUltima(ModelMap model){
 		model.addAttribute("loggedinuser", getPrincipal());
 		return "ReporteUltimaTransferencia";
 	}
  
  //Controles para generacion del comprobante de Cotizaciones
  @RequestMapping(value={"/cotizaciones"}, method = RequestMethod.GET)
	public String cotizaciones(ModelMap model){
		model.addAttribute("loggedinuser", getPrincipal());
		return "GenerarCotizacion";
	}
    
 @RequestMapping(value={"/repo_cotizacion"}, method = RequestMethod.GET)
	public String repotCotizacion(ModelMap model){
		model.addAttribute("loggedinuser", getPrincipal());
		return "ReporteCotizacion";
 }
 
 //Controles para generacion del reporte de Ventas
 @RequestMapping(value={"/ventas"}, method = RequestMethod.GET)
	public String ventas(ModelMap model){
		model.addAttribute("loggedinuser", getPrincipal());
		return "GenerarReporteVentas";
	}
   
@RequestMapping(value={"/repo_ventas"}, method = RequestMethod.GET)
	public String repotVentas(ModelMap model){
		model.addAttribute("loggedinuser", getPrincipal());
		return "ReporteVentas";
}

//Controles para generacion del reporte de Ventas
@RequestMapping(value={"/entrada_mensual"}, method = RequestMethod.GET)
	public String entradaMensual(ModelMap model){
		model.addAttribute("loggedinuser", getPrincipal());
		return "GenerarReporteMensualEntradas";
	}
  
@RequestMapping(value={"/repo_entrada_mensual"}, method = RequestMethod.GET)
	public String repotEntradaMensual(ModelMap model){
		model.addAttribute("loggedinuser", getPrincipal());
		return "ReporteMensualEntrada";
}

//Controles para generacion del reporte de Ventas por Especifico de Gastos
@RequestMapping(value={"/venta_mensual_gastos"}, method = RequestMethod.GET)
	public String ventaMensualGastos(ModelMap model){
		model.addAttribute("loggedinuser", getPrincipal());
		return "GenerarReporteVentasMensualGastos";
	}

@RequestMapping(value={"/repo_ventas_mensual_gastos"}, method = RequestMethod.GET)
	public String repotVentasMensualGastos(ModelMap model){
		model.addAttribute("loggedinuser", getPrincipal());
		return "ReporteMensualVentasGastos";
}
 
//Controles para generacion del reporte de cierre de caja
@RequestMapping(value={"/cierre_caja"}, method = RequestMethod.GET)
	public String cierreCaja(ModelMap model){
		model.addAttribute("loggedinuser", getPrincipal());
		return "GenerarReporteCierreCaja";
	}

@RequestMapping(value={"/repo_cierre_caja"}, method = RequestMethod.GET)
	public String repotCierreCaja(ModelMap model){
		model.addAttribute("loggedinuser", getPrincipal());
		return "ReporteCierreCaja";
}


  //**************************************************************************
    // *****************CONTROLES PARA LAS BUSQUEDAS **************************
    //*************************************************************************
    @RequestMapping(value = { "/producto-busqueda" }, method = RequestMethod.GET)
    public String busquedaProducto(ModelMap model ) throws IOException {
 
        Busqueda busqueda = new Busqueda();  
        model.addAttribute("busqueda",busqueda);
        model.addAttribute("loggedinuser", getPrincipal());
        return "producto-busqueda";
    }
    
    
    @RequestMapping(value = { "/producto-busqueda" }, method = RequestMethod.POST)
    public String enviarParametros(Busqueda busqueda, ModelMap model) throws IOException {
    
    	Editorial editorial = editorialService.findById(busqueda.getCodigoeditorial());
    	Area area = areaService.findById(busqueda.getCodigoarea());
    	Proveedor proveedor = proveedorService.findById(busqueda.getCodigoproveedor());
    	TipoProducto tipoproducto = tipoProductoService.findByCodTipoProducto(busqueda.getCodTipoProducto());
    	Autor autor = autorService.findById(busqueda.getCodigoautor());
    	
    	List<Producto> productos = productoService.customSearch(area, editorial, proveedor, tipoproducto, autor, busqueda);
    	for(Producto producto: productos){
        	producto.setImg(byteToString(producto.getImagen()));
        }
    	System.out.println(productos);
    	model.addAttribute("productos", productos);
    	model.addAttribute("busqueda", busqueda);
    	model.addAttribute("loggedinuser", getPrincipal());
    	return "producto-busqueda";
    }
   
    @RequestMapping(value = { "/producto-busqueda-res" }, method = RequestMethod.GET)
    public String ResultadobusquedaProducto(Busqueda busqueda, ModelMap model) throws IOException {
 
    	System.out.println(busqueda+"--->");
    	model.addAttribute("busqueda", busqueda);
    	model.addAttribute("loggedinuser", getPrincipal());
        return "producto-busqueda-res";
    }
    
    //*************************************************************************
    // ***************** CONTOLES PARA REQUISICIONES **************************
    //*************************************************************************
    
    @RequestMapping(value = { "/detallerequisicion-list" }, method = RequestMethod.GET)
    public String listRequisiciones(ModelMap model) throws IOException {
    	List<DetalleRequisicion> detallerequisicion = detallerequisicionService.findAllRequisiciones();
        model.addAttribute("detallerequisicion", detallerequisicion);
        model.addAttribute("loggedinuser", getPrincipal());
        return "detallerequisicion-list";
    }
    
    @RequestMapping(value = { "/requisicion-detalle-{codigorequisicion}" }, method = RequestMethod.GET)
    public String listDetalleRequisicion(HttpServletRequest request,@PathVariable Integer codigorequisicion, ModelMap model) throws IOException {
        Requisicion requisicion = requisicionService.findById(codigorequisicion);
    	model.addAttribute("requisicion", requisicion);
        HttpSession sesion=request.getSession(true);
        sesion.setAttribute("codigoultimo", codigorequisicion);
        
        if(sesion.getAttribute("codigoultimo") != null)
        {
          Integer codigo1 = (Integer) sesion.getAttribute("codigoultimo");
          List<DetalleRequisicion> requisicionBuscar = detallerequisicionService.findRequisiciones(codigo1);          
          model.addAttribute("req1", requisicionBuscar); 
        }
        
        return "requisicion-detalle";
    } 
    
    /*@RequestMapping(value = { "/requisicion-detalle-{codigorequisicion}" }, method = RequestMethod.GET)
    public String listDetalleReq(@PathVariable Integer codigorequisicion, ModelMap model) throws IOException {
    	DetalleRequisicion req = detallerequisicionService.findByCodigo(codigorequisicion);
    	model.addAttribute("requisiciones", req);
    	model.addAttribute("loggedinuser", getPrincipal());
        return "requisicion-detalle";
    }*/   
    
    @RequestMapping(value = { "/requisicion-list" }, method = RequestMethod.GET)
    public String listReq(ModelMap model) throws IOException {
    	List<Requisicion> requisiciones = requisicionService.findAllRequisiciones();                
        model.addAttribute("requisiciones", requisiciones);
        model.addAttribute("loggedinuser", getPrincipal());
        return "requisicion-list";
    }       
    
    @RequestMapping(value = { "/detallerequisicion-agregar" }, method = RequestMethod.GET)
    public String newdetalleRequisicion( HttpServletRequest request,ModelMap model) {
        DetalleRequisicion detallerequisicion = new DetalleRequisicion();
        model.addAttribute("detallerequisicion", detallerequisicion);
        model.addAttribute("edit", false);
        model.addAttribute("loggedinuser", getPrincipal());
    	HttpSession sesion=request.getSession(true);
    	    	
    	List<Requisicion> req5 = requisicionService.findAllRequisiciones();
		Integer req6 = req5.get(req5.size()-1).getCodigorequisicion();
        HttpSession sesion1=request.getSession(true);
        sesion1.setAttribute("codigo2", req6);
        
        Double total = 0.0;
        if(sesion.getAttribute("codigo2")!=null)
    	{
    		Integer codigo2=(Integer) sesion.getAttribute("codigo2");
    		List<DetalleRequisicion> requisicionBuscar = detallerequisicionService.findRequisiciones(codigo2);
    		
    		for (int i = 0; i < requisicionBuscar.size(); i++){
       		   total=total+requisicionBuscar.get(i).getSubtotal(); //aqui se calcula el total     		  
       	  	}
      		model.addAttribute("total", total);
    		model.addAttribute("req1", requisicionBuscar);
    	}
    	// Controla la visualizacion del Boton Guardar Requisicion 
        if(!detallerequisicionService.findRequisiciones(req6).isEmpty())	
    	{	
	    	model.addAttribute("control", 1);
    	}
    	
        List<Producto> productos = productoService.findAllProductos();
        model.addAttribute("producto", productos);
        return "detallerequisicion-reg";
  }
    
    @RequestMapping(value = { "/detallerequisicion-agregar" }, method = RequestMethod.POST)   
    public String saveRequisicion( HttpServletRequest request,@Valid DetalleRequisicion detallerequisicion, BindingResult result, 
    		ModelMap model,@RequestParam(required = false) String destino, String fecharequisicion, boolean estado ) throws IOException, ParseException {
         	 	
    	if (result.hasErrors()) {
            return "detallerequisicion-reg";
        }
    	detallerequisicionService.saveDetalleRequisicion(detallerequisicion);
    	
    	Integer codigorequisicion = Integer.parseInt(request.getParameter("codigorequisicion"));
    	HttpSession sesion2=request.getSession(true);
    	Date fecharequisicion1 = new SimpleDateFormat("yyyy-MM-dd").parse(fecharequisicion);    	
    	requisicionService.updateFechaRequisicion(fecharequisicion1, destino, codigorequisicion, estado);
    	SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
    	String fecha = sdf.format(fecharequisicion1);
 		sesion2.setAttribute("mySessionAttribute", fecha);
    	model.addAttribute("loggedinuser", getPrincipal());
    return "redirect:/detallerequisicion-agregar";      
    }
    
    @RequestMapping(value = { "/delete-detallerequisicion-{codigorequisicion}" }, method = RequestMethod.GET) // Borrar un producto de la lista
    public String deleteRequisicion(@PathVariable Integer codigorequisicion) {    	
    	detallerequisicionService.deleteRequisicionById(codigorequisicion);
    	return "redirect:/detallerequisicion-agregar";        
    }
    
    @RequestMapping(value = { "/delete-requisicion-{codigoreq}" }, method = RequestMethod.GET) // Eliminar. Cambia de estado. Las oculta
    public String deleteRequisicionMaestra(@PathVariable Integer codigoreq) {    	
    	requisicionService.updateEstadoRequisicionById(codigoreq);    	
        return "redirect:/requisicion-list";
    }
    
    @RequestMapping(value = { "/guardar" }, method = RequestMethod.GET)
    public String saveDetalleRequisicion( HttpServletRequest request,ModelMap model)throws IOException, ParseException {
    	
          HttpSession sesion=request.getSession(true);    	
          Integer codigorequisicion = (Integer) sesion.getAttribute("codigo2");          
          sesion.setAttribute("codigoultimo", codigorequisicion);         
         // Se lee el valor a comparar. SALA o BODEGA 
          String destino = requisicionService.findById(codigorequisicion).getDestino();
      	
	      Double total = 0.0;
	      if(sesion.getAttribute("codigo2")!=null)
	      {
	      	Integer codigo2=(Integer) sesion.getAttribute("codigo2");
	      	List<DetalleRequisicion> requisicionBuscar = detallerequisicionService.findRequisiciones(codigo2);
	      		
	      	for (int i = 0; i < requisicionBuscar.size(); i++){
	       		   total=total+requisicionBuscar.get(i).getSubtotal(); //aqui se calcula el total     		  
	       	} 
	      }       
	      requisicionService.updateTotal(codigorequisicion, total);
      	  
          List<DetalleRequisicion> requisicionBuscar = detallerequisicionService.findRequisiciones(codigorequisicion);
          for(int i=0;i<requisicionBuscar.size();i++){
        	  
        	  Integer codigoproducto = requisicionBuscar.get(i).getCodigoproducto();
        	  Integer bodega1 = requisicionBuscar.get(i).getBodega();        	  
        	  Integer sala1 = requisicionBuscar.get(i).getSala();
        	  Integer cantidad = requisicionBuscar.get(i).getCantidad();
        	  
        	  if (destino.equals("BODEGA")){
	        	  Integer existencia = bodega1 + cantidad;
	        	  Integer sala = sala1 - cantidad;
	        	  productoService.updateExistencia(codigoproducto, existencia, sala);
        	  }
        	  else {
        		  Integer existencia = bodega1 - cantidad;
            	  Integer sala = sala1 + cantidad;
            	  productoService.updateExistencia(codigoproducto, existencia, sala);
        	  }        	  
          }          
       
          String fecha =(String) sesion.getAttribute("mySessionAttribute");          
          Date fecharequisicion1 = new SimpleDateFormat("yyyy-MM-dd").parse(fecha);          
          Requisicion requisicion = new Requisicion();
          //Valores por defecto para inicializar la nueva requisiscion
          requisicion.setDestino("SALA");
          requisicion.setFecha(fecharequisicion1);
          requisicion.setTotal(0.0);
          requisicion.setEstado(true);
  		  requisicionService.saveRequisicion(requisicion);  		
          Integer codigo2 = 0;
		  sesion.setAttribute("codigo2", codigo2);
    	
		return "GenerarReporteRequisicion";

    }
    
    
    
    @RequestMapping(value = { "/guardar-update" }, method = RequestMethod.GET)
    public String saveDetalleRequisicionUpdate( HttpServletRequest request,ModelMap model)throws IOException, ParseException {
    	
          HttpSession sesion=request.getSession(true);    	
          
          Integer punto=(Integer) sesion.getAttribute("punto");
          Integer codigorequisicion = (Integer) sesion.getAttribute("codigo2");          
          sesion.setAttribute("codigoultimo", codigorequisicion);         
         // Se lee el valor a comparar. SALA o BODEGA 
          String destino = requisicionService.findById(codigorequisicion).getDestino();
      	
	      Double total = 0.0;
	      if(sesion.getAttribute("codigo2")!=null)
	      {
	      	Integer codigo2=(Integer) sesion.getAttribute("codigo2");
	      	List<DetalleRequisicion> requisicionBuscar = detallerequisicionService.findRequisiciones(codigo2);
	      		
	      	for (int i = 0; i < requisicionBuscar.size(); i++){
	       		   total=total+requisicionBuscar.get(i).getSubtotal(); //aqui se calcula el total     		  
	       	} 
	      }       
	      requisicionService.updateTotal(codigorequisicion, total);
      	  
          List<DetalleRequisicion> requisicionBuscar = detallerequisicionService.findRequisiciones(codigorequisicion);
          for(int i=punto;i<requisicionBuscar.size();i++){
        	  
        	  Integer codigoproducto = requisicionBuscar.get(i).getCodigoproducto();
        	  Integer bodega1 = requisicionBuscar.get(i).getBodega();        	  
        	  Integer sala1 = requisicionBuscar.get(i).getSala();
        	  Integer cantidad = requisicionBuscar.get(i).getCantidad();
        	  
        	  if (destino.equals("BODEGA")){
	        	  Integer existencia = bodega1 + cantidad;
	        	  Integer sala = sala1 - cantidad;
	        	  productoService.updateExistencia(codigoproducto, existencia, sala);
        	  }
        	  else {
        		  Integer existencia = bodega1 - cantidad;
            	  Integer sala = sala1 + cantidad;
            	  productoService.updateExistencia(codigoproducto, existencia, sala);
        	  }        	  
          }          
       
          String fecha =(String) sesion.getAttribute("mySessionAttribute");          
          Date fecharequisicion1 = new SimpleDateFormat("yyyy-MM-dd").parse(fecha);
          //Double total=(Double) sesion.getAttribute("total");
          Requisicion requisicion = new Requisicion();
          //Valores por defecto para inicializar la nueva requisiscion
          requisicion.setDestino("SALA");
          requisicion.setFecha(fecharequisicion1);
          requisicion.setTotal(0.0);
          requisicion.setEstado(true);
  		  //requisicionService.saveRequisicion(requisicion);
          requisicionService.updateDatosReq(codigorequisicion, fecharequisicion1, destino);
          
          Integer codigo2 = 0;
		  sesion.setAttribute("codigo2", codigo2);
    	
		return "GenerarReporteRequisicion";

    }
    
    
    @RequestMapping(value = { "/edit-requisiciones-{codigorequisicion}" }, method = RequestMethod.GET)
    public String editRequisiciones(@PathVariable Integer codigorequisicion, ModelMap model, HttpServletRequest request) throws IOException, ParseException{

    	DetalleRequisicion detallereq = new DetalleRequisicion();
    	model.addAttribute("detallerequisicion", detallereq);
        HttpSession sesion = request.getSession();
        sesion.setAttribute("codigoreq", codigorequisicion); 
  	  	Producto producto=new Producto();		
  	  	Double total=0.0;
	
  	  	if(!detallerequisicionService.findRequisiciones(codigorequisicion).isEmpty())
  	  		{
	  	  	 	List<DetalleRequisicion> reqBuscar = detallerequisicionService.findRequisiciones(codigorequisicion); 
	  	  	 	List<Producto> productos = productoService.findAllProductos();
			   
	  	  	 	Requisicion req = requisicionService.findById(codigorequisicion);				    	 
	  	  	 	Date fechareq = req.getFecha();
	  	  	 	String destino = req.getDestino();
	  	  	 	Integer codigodetalle = reqBuscar.get(0).getCodigodetalle();
	    	   
	  	  	 	DetalleRequisicion detallereq1 = detallerequisicionService.findById(codigodetalle);
				
	  	  	 	sesion.setAttribute("punto", reqBuscar.size()-1);//ALAMACENA DESDE DONDE TIENE QUE EMPEZAR DE NUEVO
			    	 
	  	  	 	Integer d = reqBuscar.get(reqBuscar.size()-1).getCodigodetalle();
	  	  	 		for (int i = 0; i < reqBuscar.size(); i++){
	  	  	 			total=total+reqBuscar.get(i).getSubtotal(); //aqui se calcula el total
	  	  	 		}    	  
			    	 	
			        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");//este es el formato que agarra el navegador
			    	String fecha = sdf.format(fechareq);
			    	
			    	model.addAttribute("detallerequisicion", detallereq);	
			    	model.addAttribute("codigorequisicion",codigorequisicion );
			    	model.addAttribute("fechareq",fecha );
			    	model.addAttribute("total", total);
			    	model.addAttribute("destino", destino);
			    			    	
			    	model.addAttribute("producto", productos);
				    model.addAttribute("total", total);
			    	model.addAttribute("req1", reqBuscar);	
			        model.addAttribute("edit", true);
			        model.addAttribute("loggedinuser", getPrincipal());				        		        
			        
			    	sesion.setAttribute("codigoreq", codigorequisicion);
			 		sesion.setAttribute("fechareq", fecha);//se almacena la fecha para utilizarlo en finalizar retaceo
			 		sesion.setAttribute("total", total);
		        return "detallerequisicion-modificar";
  	  		}
  	  	return "redirect:/detalleretaceo-list";		      
    }
         
    @RequestMapping(value = { "/edit-requisiciones-{codigorequisicion}" }, method = RequestMethod.POST)
    public String updateRequisiciones(@Valid DetalleRequisicion detallerequisicion, BindingResult result,
            ModelMap model, @PathVariable Integer codigorequisicion,HttpServletRequest request)	throws IOException, ParseException {
 
        if (result.hasErrors()) {
            return "detallerequisicion-modificar";
        }
        
        HttpSession sesion = request.getSession();
        Integer punto = (Integer)sesion.getAttribute("punto");
        detallerequisicionService.saveDetalleRequisicion(detallerequisicion);
        model.addAttribute("loggedinuser", getPrincipal());
        return "redirect:/edit-requisiciones-{codigorequisicion}";
    }

    
    
    
    // ******************************** Finaliza REQUISICIONES
    
       
    //*************************************************************************
    // ***************** CONTROLES PARA FACTURACION **************************
    //*************************************************************************
    
    @RequestMapping(value = { "/factura-list" }, method = RequestMethod.GET)
    public String listFactura(ModelMap model) throws IOException {
    	List<Factura> facturas = facturaService.findAllFacturas();                
        model.addAttribute("facturas", facturas);
        model.addAttribute("loggedinuser", getPrincipal());
        return "factura-list";
    }
    
    @RequestMapping(value = { "/factura-detalle-{idfactura}" }, method = RequestMethod.GET)
    public String detalleFactura(HttpServletRequest request,@PathVariable Integer idfactura, ModelMap model) throws IOException {
    	Factura factura = facturaService.findById(idfactura);
    	model.addAttribute("factura", factura);
    	HttpSession sesion=request.getSession(true);
    	sesion.setAttribute("codigoultimo", idfactura);
    	
    	if(sesion.getAttribute("codigoultimo")!=null)
    	{
    		Integer codigofact = (Integer) sesion.getAttribute("codigoultimo");
    		List<FacturaDetalle> facturaBuscar = facturadetalleService.findFacturas(codigofact);
    		model.addAttribute("facturas", facturaBuscar);
    	}
    	
        return "factura-detalle";
    } 
    
    @RequestMapping(value = { "/detallefacturacion-agregar" }, method = RequestMethod.GET)
    public String newDetalleFacturacion( HttpServletRequest request,ModelMap model) {
    	
    	FacturaDetalle facturadetalle = new FacturaDetalle();
        model.addAttribute("facturadetalle", facturadetalle);
        model.addAttribute("edit", false);
        model.addAttribute("loggedinuser", getPrincipal());
    	HttpSession sesion=request.getSession(true);
    	
    	Double total = 0.0;
    	if(sesion.getAttribute("codigofact")!=null)
    	{
    		Integer codigofact = (Integer) sesion.getAttribute("codigofact");
    		List<FacturaDetalle> facturaBuscar = facturadetalleService.findFacturas(codigofact);
    		
    		for (int i = 0; i < facturaBuscar.size(); i++){
      		   total=total+facturaBuscar.get(i).getSubtotalfactura(); //aqui se calcula el total     		  
      	  	}
     		model.addAttribute("total", total); 
    		model.addAttribute("facturas", facturaBuscar);
    	}
    	
    	List<Producto> productos = productoService.findAllProductos();       
		List<Factura> fact = facturaService.findAllFacturas();
		Integer fact1 = fact.get(fact.size()-1).getIdfactura();
        HttpSession sesion1=request.getSession(true);
        sesion1.setAttribute("codigofact", fact1);        
        model.addAttribute("producto", productos);
    
	    	String tipo = facturaService.findById(fact1).getTipocredito();
	    	if(tipo.equals("EMPLEADOS UES") || tipo.equals("INSTITUCIONAL") ){
	    		model.addAttribute("control", 2);
	    	}
	    	else
	    		model.addAttribute("control", 3);
        
        // Numero de factura
        Integer numero = facturaService.findById(fact1).getNumerofactura();
        sesion1.setAttribute("numero", numero); 
        
    	return "facturadetalle-reg"; 
    }
    
    @RequestMapping(value = { "/detallefacturacion-agregar" }, method = RequestMethod.POST)   
    public String saveFactura( HttpServletRequest request,@Valid FacturaDetalle facturadetalle, BindingResult result, 
    		ModelMap model,@RequestParam(required = false)  String fechafactura, Integer numerofactura, String cliente, String direccion, String documento, String tipocredito) 
    		throws IOException, ParseException {
         	 	
    	if (result.hasErrors()) {
            return "facturadetalle-reg";
        }
    	facturadetalleService.saveFacturaDetalle(facturadetalle);
		
    	
    	Integer idfactura = Integer.parseInt(request.getParameter("idfactura"));
    	HttpSession sesion2=request.getSession(true);
    	Date fecha1 = new SimpleDateFormat("yyyy-MM-dd").parse(fechafactura);    	
    	facturaService.updateFacturaDatos(idfactura, fecha1, numerofactura, cliente, direccion, documento, tipocredito);
    	SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
    	String fecha = sdf.format(fecha1);
 		sesion2.setAttribute("mySessionAttribute", fecha);
    	model.addAttribute("loggedinuser", getPrincipal());
    	
    	return "redirect:/detallefacturacion-agregar";      
    }
    
    @RequestMapping(value = { "/delete-detallefactura-{idfacturadetalle}" }, method = RequestMethod.GET)
    public String deleteFactura(@PathVariable Integer idfacturadetalle) {    	
    	facturadetalleService.deleteFacturaById(idfacturadetalle);
    	return "redirect:/detallefacturacion-agregar";        
    }
    
    @RequestMapping(value = { "/cambio-estado-factura-{idfactura}" }, method = RequestMethod.GET)
    public String updateEstadoFactura(@PathVariable Integer idfactura) {    	
    	
		Integer fact = facturaService.findById(idfactura).getIdfactura();
    	
    	List<FacturaDetalle> facturaBuscar = facturadetalleService.findFacturas(fact);         
        for(int i=0;i<facturaBuscar.size();i++){
       	 Integer codigoproducto = facturaBuscar.get(i).getCodigoproducto();
       	 Integer sala = productoService.findByCorrelativo(codigoproducto).getSala();
       	 Integer cantidad = facturaBuscar.get(i).getCantidad();
       	 Integer existencia = sala + cantidad;
	     productoService.updateSalaVenta1(codigoproducto, existencia);
	    }
    	facturaService.updateEstadoFacturaById(fact);
    	
    	return "redirect:/factura-list";        
    }
    
    @RequestMapping(value = { "/cancelar-factura-{idfactura}" }, method = RequestMethod.GET)
    public String cancelarFactura(@PathVariable Integer idfactura) {    	
    	
    	List<Factura> fact = facturaService.findAllFacturas();
		Integer fact1 = fact.get(fact.size()-1).getIdfactura();
		Integer fact2 = fact.get(fact.size()-2).getIdfactura();
    	
    	List<FacturaDetalle> facturaBuscar = facturadetalleService.findFacturas(fact2);         
        for(int i=0;i<facturaBuscar.size();i++){
       	 Integer codigoproducto = facturaBuscar.get(i).getCodigoproducto();
	     Integer existencia = facturaBuscar.get(i).getSala();
	     productoService.updateSalaVenta1(codigoproducto, existencia);
	     facturadetalleService.deleteFacturaByName(fact2);
        }
        facturaService.deleteFacturaById(fact1);
    	
    	return "redirect:/detallefacturacion-agregar";        
    }
    
    @RequestMapping(value = { "/facturar-contado" }, method = RequestMethod.GET)
    public String saveFacturacionContado( HttpServletRequest request,ModelMap model,@RequestParam(required = false) 
    	   String fecha, String nombre)throws IOException, ParseException {
    	
    	HttpSession sesion1=request.getSession(true);
    	
    	Double total = 0.0;    	
    	if(sesion1.getAttribute("codigofact")!=null)
    	{
    		Integer codigofact = (Integer) sesion1.getAttribute("codigofact");
    		List<FacturaDetalle> facturaBuscar = facturadetalleService.findFacturas(codigofact);
    		
    		for (int i = 0; i < facturaBuscar.size(); i++){
      		   total=total+facturaBuscar.get(i).getSubtotalfactura(); //aqui se calcula el total     		  
      	  	}
    	}  	
    	
    	String tipofact = "CONTADO";    	 
   	 	    	
    	 HttpSession sesion=request.getSession(true);    	
         Integer codigofact = (Integer) sesion.getAttribute("codigofact");          
         sesion.setAttribute("codigoultimo", codigofact);
         
         facturaService.updateFacturaDatos2(codigofact, total, tipofact);
         String documento = "";
         String tipocredito = "";
         facturaService.updateFacturaDatos3(codigofact, documento, tipocredito);
         
         List<FacturaDetalle> facturaBuscar = facturadetalleService.findFacturas(codigofact);         
         for(int i=0;i<facturaBuscar.size();i++){
        	 Integer codigoproducto = facturaBuscar.get(i).getCodigoproducto();
	       	 Integer cantidad = facturaBuscar.get(i).getCantidad();	       	 
	       	 Integer existencia = facturaBuscar.get(i).getSala();
	       	 Integer sala = existencia - cantidad;
	       	 productoService.updateSalaVenta1(codigoproducto, sala);
         }
         
         Integer numerofac = facturaService.findById(codigofact).getNumerofactura();
         
         String fechafac =(String) sesion.getAttribute("mySessionAttribute");          
         Date fechafactura1 = new SimpleDateFormat("yyyy-MM-dd").parse(fechafac);          
         Factura factura = new Factura();         
         factura.setFechafactura(fechafactura1);
         factura.setNumerofactura(numerofac + 1);
         factura.setTipofactura("CONTADO");
         factura.setTotal(0.0);
         factura.setCliente("");
         factura.setDireccion("");
         factura.setDocumento("");
         factura.setTipocredito("");
         factura.setEstado(true);
 		 facturaService.saveFactura(factura);  		
         Integer idfactura = 0;
		 sesion.setAttribute("codigofact", idfactura);
    	
		 return "GenerarFactura";
    	//return "redirect:/detallefacturacion-agregar";
    }

    @RequestMapping(value = { "/facturar-credito" }, method = RequestMethod.GET)
    public String saveFacturacionCredito( HttpServletRequest request, ModelMap model,@RequestParam(required = false) 
    		String fecha)throws IOException, ParseException {
    	
    	HttpSession sesion1=request.getSession(true);
    	
    	Double total = 0.0;    	
    	if(sesion1.getAttribute("codigofact")!=null)
    	{
    		Integer codigofact = (Integer) sesion1.getAttribute("codigofact");
    		List<FacturaDetalle> facturaBuscar = facturadetalleService.findFacturas(codigofact);
    		
    		for (int i = 0; i < facturaBuscar.size(); i++){
      		   total=total+facturaBuscar.get(i).getSubtotalfactura(); //aqui se calcula el total     		  
      	  	}
    	}
    	
    	 String tipo = "CREDITO";     	
    	 
    	 HttpSession sesion=request.getSession(true);    	
         Integer codigofact = (Integer) sesion.getAttribute("codigofact");          
         sesion.setAttribute("codigoultimo", codigofact);
         
         facturaService.updateFacturaDatos2(codigofact, total, tipo);
                          
         List<FacturaDetalle> facturaBuscar = facturadetalleService.findFacturas(codigofact);         
         for(int i=0;i<facturaBuscar.size();i++){
        	 Integer codigoproducto = facturaBuscar.get(i).getCodigoproducto();
	       	 Integer cantidad = facturaBuscar.get(i).getCantidad();	       	 
	       	 Integer existencia = facturaBuscar.get(i).getSala();
	       	 Integer sala = existencia - cantidad;
	       	 productoService.updateSalaVenta1(codigoproducto, sala);
         }
         
         Integer numerofac = facturaService.findById(codigofact).getNumerofactura();
         
         String fechafac =(String) sesion.getAttribute("mySessionAttribute");          
         Date fechafactura1 = new SimpleDateFormat("yyyy-MM-dd").parse(fechafac);          
         Factura factura = new Factura();
         factura.setFechafactura(fechafactura1);
         factura.setNumerofactura(numerofac + 1);
         factura.setTipofactura("CREDITO");
         factura.setTotal(0.0);
         factura.setCliente("");
         factura.setDireccion("");
         factura.setDocumento("");
         factura.setTipocredito("");
         factura.setEstado(true);
 		 facturaService.saveFactura(factura);  		
         Integer idfactura = 0;
		 sesion.setAttribute("codigofact", idfactura);
    	
		 return "GenerarFactura";
    	//return "redirect:/detallefacturacion-agregar";
    }
    
    
    // NUMERO DE FACTURA -------------------------------------------------------------------
    @RequestMapping(value = { "/numero-factura" }, method = RequestMethod.GET)
    public String newNumeroFactura(ModelMap model) {
    	
    	Factura factura = new Factura();
        model.addAttribute("factura", factura);
        model.addAttribute("edit", false);
        model.addAttribute("loggedinuser", getPrincipal());
        
        List<Factura> fact = facturaService.findAllFacturas();
		Integer fact2 = fact.get(fact.size()-2).getIdfactura();
		Integer numero = facturaService.findById(fact2).getNumerofactura();
        model.addAttribute("numfactura", numero);
        
    	return "factura-set-numero"; 
    }
    
    @RequestMapping(value = { "/numero-factura" }, method = RequestMethod.POST)   
    public String saveNumeroFactura(@Valid Factura factura, BindingResult result, ModelMap model) throws IOException {
         	 	
    	if (result.hasErrors()) {
            return "factura-set-numero";
        }
    	List<Factura> fact = facturaService.findAllFacturas();
		Integer fact1 = fact.get(fact.size()-1).getIdfactura();
		facturaService.deleteFacturaById(fact1);
		factura.setTotal(0.0);
    	facturaService.saveFactura(factura);
    	model.addAttribute("loggedinuser", getPrincipal());    	
    	return "redirect:/factura-list";      
    }
    
    // -------------------------------------------------------------------------------------------------
    // EDITAR NUMERO DE LA FACTURA Y FECHA
    @RequestMapping(value = { "/edit-numero-factura-{idfactura}" }, method = RequestMethod.GET)
    public String editNumeroFactura(@PathVariable Integer idfactura, ModelMap model) throws ParseException {
    	
    	Integer numero = facturaService.findById(idfactura).getNumerofactura();    	
    	
    	Factura factura = new Factura();
        model.addAttribute("factura", factura);
        model.addAttribute("edit", true);
        model.addAttribute("loggedinuser", getPrincipal());
        model.addAttribute("numero", numero);       
    	return "facturacion-edit"; 
    }
    
    @RequestMapping(value = { "/edit-numero-factura-{idfactura}" }, method = RequestMethod.POST)   
    public String updateNumeroFactura(HttpServletRequest request,@Valid Factura factura, BindingResult result, 
    		ModelMap model, @PathVariable Integer idfactura) throws IOException {         	 	
    	if (result.hasErrors()) {
            return "facturacion-edit";
        }
    	Integer numero2 = Integer.parseInt(request.getParameter("numerofactura"));
    	//Integer numero = facturaService.findById(idfactura).getNumerofactura();
    	facturaService.updateNumeroFactura(idfactura,numero2);
    	model.addAttribute("loggedinuser", getPrincipal());    	
    	return "redirect:/factura-list"; 
    	
    }
    
    //*************************************************************************
    //***************** RESERVACIONES DE LIBROS ******************************
    //************************************************************************
    
    @RequestMapping(value = { "/reservaciones-list" }, method = RequestMethod.GET)
    public String listReservaciones(ModelMap model) throws IOException { 
        List<Reservas> reservas = reservasService.findAllReservas();                
        model.addAttribute("reservas", reservas);
        model.addAttribute("loggedinuser", getPrincipal());
        return "reservaciones-list";
    }
    
    @RequestMapping(value = { "/reservas-agregar" }, method = RequestMethod.GET)
    public String newReservacion(ModelMap model) {
        Reservas reserv = new Reservas();
        model.addAttribute("reserv", reserv);
        model.addAttribute("edit", false);
        model.addAttribute("loggedinuser", getPrincipal());       
        return "reservas-reg";
    }
    
    @RequestMapping(value = { "/reservas-agregar" }, method = RequestMethod.POST)
    public String saveReservacion(@Valid Reservas reserv, BindingResult result, ModelMap model) throws IOException { 
    	if (result.hasErrors()) {
            return "reservas-reg";
        }                 	  	
    	reservasService.saveReservas(reserv);
    	model.addAttribute("success", "Reservacion de Libro: <strong>" + reserv.getNombreproducto() 
    						+ "</strong> Realizada a nombre de: " + reserv.getNombre()
    						+ "Con DUI numero: "+ reserv.getDui()
    						+ "Finaliza en la fecha: "+ reserv.getFechafin());
        model.addAttribute("loggedinuser", getPrincipal());       
        return "reservas-reg-succ";        
    }
    
    @RequestMapping(value = { "/edit-reservas-{codigoprod}" }, method = RequestMethod.GET)
    public String editReservas(@PathVariable Integer codigoprod, ModelMap model) throws IOException {
    	
    	Integer codigo = productoService.findByCodigoProducto(codigoprod).getCorrelativo();
    	String nombre = productoService.findByCodigoProducto(codigoprod).getNombreProducto();
    	Double prec = productoService.findByCodigoProducto(codigoprod).getPrecio();
    	TipoProducto codtipo = productoService.findByCodigoProducto(codigoprod).getTipoProducto();
    	List<Reservas> reservas = reservasService.findAllReservas(); 
    	Reservas reserv = new Reservas();
        model.addAttribute("reserv", reserv);
        model.addAttribute("reservas", reservas);
        model.addAttribute("edit", true);
        if(codtipo.equals("Libro")){
        	model.addAttribute("libro", true);
        	model.addAttribute("tipo", codtipo);
        }
        else {
	        model.addAttribute("libro", false);
	        model.addAttribute("tipo", codtipo);
        }
        model.addAttribute("loggedinuser", getPrincipal());
        model.addAttribute("codigo", codigo);
        model.addAttribute("nombre", nombre);
        model.addAttribute("prec", prec);
        
        
        return "reservas-reg";
    }
    
    @RequestMapping(value = { "/edit-reservas-{codigoprod}" }, method = RequestMethod.POST)   
    public String updateReservas(@Valid Reservas reserv, BindingResult result, 
    		ModelMap model, @PathVariable Integer codigoprod) throws IOException {
    	
    	if (result.hasErrors()) {
            return "reservas-reg";
        }
    	Integer codigo = productoService.findByCodigoProducto(codigoprod).getCodigoProducto();
    	Integer sala = productoService.findByCodigoProducto(codigoprod).getSala() - 1;
    	
    	reservasService.saveReservas(reserv);
    	model.addAttribute("success", "Reservacion de Libro: <strong>" + reserv.getNombreproducto() 
							+ ". </strong> Realizada a nombre de: " + reserv.getNombre()
							+ ". Con DUI numero: "+ reserv.getDui()
							+ ". Finaliza en la fecha: "+ reserv.getFechafin());
        model.addAttribute("loggedinuser", getPrincipal());
        productoService.updateReserva(codigo,sala);
        return "reservas-reg-succ";
    }
    
    @RequestMapping(value = { "/delete-reserva-{idreservas}" }, method = RequestMethod.GET)
    public String deleteReserva(@PathVariable Integer idreservas) {    	
    	reservasService.deleteReservas(idreservas);
    	//Integer cod = reservasService.findById(idreservas).getCodigoproducto();
    	//Integer sala = productoService.findByCorrelativo(cod).getSala() + 1;
    	//productoService.updateReservaRestaurar(cod,sala);
    	return "redirect:/reservaciones-list";        
    }
    
    
    
    /*************************************************************************************************************************************************************
     ********************************************** Cotizaciones de Productos ************************************************************************************
     *************************************************************************************************************************************************************/
       
      
      @RequestMapping(value = { "/cotizacion-list" }, method = RequestMethod.GET)
      public String listCotizacion(ModelMap model) throws IOException { 
          List<Cotizacion> cotizaciones = cotizacionService.findAllCotizaciones();                
          model.addAttribute("cotizaciones", cotizaciones);
          model.addAttribute("loggedinuser", getPrincipal());
          return "cotizaciones-list";
      }
      
      @RequestMapping(value = { "/cotizacion-detalle-{codigoCotizacion}" }, method = RequestMethod.GET)
      public String listDetalleCotizacion(HttpServletRequest request,@PathVariable Integer codigoCotizacion, ModelMap model) throws IOException {
      Cotizacion cotizacion = cotizacionService.findById(codigoCotizacion);
      model.addAttribute("cotizacion", cotizacion);
      HttpSession sesion=request.getSession(true);
      sesion.setAttribute("codigoultimo", codigoCotizacion);
          
      if(sesion.getAttribute("codigoultimo") != null)
      {
    	  Integer codigo6 = (Integer) sesion.getAttribute("codigoultimo");
          List<DetalleCotizacion> cotizacionBuscar = detallecotizacionService.findCotizaciones(codigo6);          
            model.addAttribute("cotiza1", cotizacionBuscar); 
          }
          
          return "cotizacion-detalle";
      }
        
      @RequestMapping(value = { "/detallecotizacion-agregar" }, method = RequestMethod.GET)
      public String newdetalleCotizacion( HttpServletRequest request,ModelMap model) {
      	DetalleCotizacion detallecotizacion = new DetalleCotizacion();
      	model.addAttribute("detallecotizacion", detallecotizacion);
        model.addAttribute("edit", false);
        model.addAttribute("loggedinuser", getPrincipal());
      	HttpSession sesion = request.getSession(true);
      	
      	//HttpSession sesion2=request.getSession(true);
      	
      	Double total = 0.0;
      	if(sesion.getAttribute("codigo6") != null)
      	{
      		Integer codigo6 = (Integer) sesion.getAttribute("codigo6");
      		List<DetalleCotizacion> cotizacionBuscar = detallecotizacionService.findCotizaciones(codigo6);
      		
      		for (int i = 0; i < cotizacionBuscar.size(); i++){
      			total = total + cotizacionBuscar.get(i).getValorTotal();  		  
        	}
       		model.addAttribute("total", total); 
      		model.addAttribute("cotiza1", cotizacionBuscar);
      		
      	  
    System.out.println("revisar:----------------------------------------------------------------------------" + cotizacionBuscar.size());
      	
      		
      	}
      	
      	List<Producto> productos = productoService.findAllProductos();       
      	//Incrementar Cotizacion
      	List<Cotizacion> cotiza5 = cotizacionService.findAllCotizaciones();//facturaService.findAllFacturas();
  		Integer cotiza6 = cotiza5.get(cotiza5.size()-1).getCodigoCotizacion();//.getNumeroCotizacion();//.getIdfactura();
        HttpSession sesion1 = request.getSession(true);
        sesion1.setAttribute("codigo6", cotiza6);        
        model.addAttribute("producto", productos);
          // Numero de cotizacion
          //Integer numero2 = cotizacionService.findById(cotizacion6).getNumeroCotizacion();
          //sesion1.setAttribute("numero2", numero2); 
      	return "detallecotizacion-reg"; 
      }
      
      @RequestMapping(value = { "/detallecotizacion-agregar" }, method = RequestMethod.POST)   
      public String saveCotizacion( HttpServletRequest request,@Valid DetalleCotizacion detallecotizacion, BindingResult result, 
      		ModelMap model,@RequestParam(required = false)  String fechaCotizacion, String nombreCliente, String telefono, String correo) 
      		throws IOException, ParseException {
           	 	
      	if (result.hasErrors()) {
              return "detallecotizacion-reg";
          }
      	
      	detallecotizacionService.saveDetalleCotizacion(detallecotizacion);
      	
      	Integer codigoCotizacion = Integer.parseInt(request.getParameter("codigoCotizacion"));
      	HttpSession sesion2 = request.getSession(true);
      	Date fechaCotizacion2 = new SimpleDateFormat("yyyy-MM-dd").parse(fechaCotizacion);
      	cotizacionService.updateFechaCotizacion(fechaCotizacion2, nombreCliente, codigoCotizacion, telefono, correo);
      	SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
      	String fecha6 = sdf.format(fechaCotizacion2);
      	sesion2.setAttribute("mySessionAttribute", fecha6);
      	model.addAttribute("loggedinuser", getPrincipal());
      	return "redirect:/detallecotizacion-agregar";
      	
      }
      
      @RequestMapping(value = { "/delete-detallecotizacion-{codigoCotizacion}" }, method = RequestMethod.GET) // Borrar un producto de la lista
      public String deleteDetalleCotizacion(@PathVariable Integer codigoCotizacion) {    	
      	detallecotizacionService.deleteCotizacionById(codigoCotizacion);
      	return "redirect:/detallecotizacion-agregar"; 
      	        
      }
      
      @RequestMapping(value = { "/delete-cotizacion-{codigoCotizacion}" }, method = RequestMethod.GET)
      public String deleteCotizacion(@PathVariable Integer codigoCotizacion) {
    	  cotizacionService.deleteCotizacionById(codigoCotizacion);     	    	
          return "redirect:/cotizacion-list";
      }
      
      
      /*
      @RequestMapping(value = { "/detallecotizacion-agregar" }, method = RequestMethod.GET)
      public String newcotizacion(ModelMap model) {
          Cotizacion cotizaciones = new Cotizacion();
          model.addAttribute("cotizaciones", cotizaciones);
          model.addAttribute("edit", false);
          model.addAttribute("loggedinuser", getPrincipal());
          //model.addAttribute("area", getPrincipal());
          return "detallecotizacion-reg";
      }*/
      
      @RequestMapping(value = { "/finalizarCotizacion" }, method = RequestMethod.GET)
      public String saveDetalleCotizacion( HttpServletRequest request,ModelMap model)throws IOException, ParseException {
      	
            HttpSession sesion=request.getSession(true);    	
            Integer codigoCotizacion = (Integer) sesion.getAttribute("codigo6");          
            sesion.setAttribute("codigoultimo", codigoCotizacion);         
           // Se lee el valor a comparar. SALA o BODEGA 
            //String destino = requisicionService.findById(codigorequisicion).getDestino();
        	
  	      Double total = 0.0;
  	      if(sesion.getAttribute("codigo6")!=null)
  	      {
  	      	Integer codigo6=(Integer) sesion.getAttribute("codigo6");
  	      	List<DetalleCotizacion> cotizacionBuscar = detallecotizacionService.findCotizaciones(codigo6);
  	      	for(int i = 0; i < cotizacionBuscar.size(); i++){
  	      		total = total + cotizacionBuscar.get(i).getValorTotal();
  	      	}
  	      }       
  	      
  	      cotizacionService.updateTotal(codigoCotizacion, total);
  	        
          /*List<DetalleCotizacion> cotizacionBuscar = detallecotizacionService.findCotizaciones(codigoCotizacion);
          for(int i =0 ; i < cotizacionBuscar.size(); i++){
          	  Integer codigoproducto = requisicionBuscar.get(i).getCodigoproducto();
          	  Integer bodega1 = requisicionBuscar.get(i).getBodega();        	  
          	  Integer sala1 = requisicionBuscar.get(i).getSala();
          	  Integer cantidad = requisicionBuscar.get(i).getCantidad();
          	  
          	  if (destino.equals("BODEGA")){
  	        	  Integer existencia = bodega1 + cantidad;
  	        	  Integer sala = sala1 - cantidad;
  	        	  productoService.updateExistencia(codigoproducto, existencia, sala);
          	  }
          	  else {
          		  Integer existencia = bodega1 - cantidad;
              	  Integer sala = sala1 + cantidad;
              	  productoService.updateExistencia(codigoproducto, existencia, sala);
          	  }        	  
            } */         
         
            String fecha6 =(String) sesion.getAttribute("mySessionAttribute");          
            Date fechaCotizacion1 = new SimpleDateFormat("yyyy-MM-dd").parse(fecha6);          
            Cotizacion cotizacion = new Cotizacion();
            //Valores por defecto para inicializar la nueva cotizacion
            cotizacion.setNombreCliente("");
            cotizacion.setTelefono("");
            cotizacion.setCorreo("");
            cotizacion.setFechaCotizacion(fechaCotizacion1);
            cotizacion.setTotal(0.0);
            cotizacionService.saveCotizacion(cotizacion);
            Integer codigo6 = 0;
  		  	sesion.setAttribute("codigo6", codigo6);
  		  	return "GenerarCotizacion";

      }
    
    
 
  //*************************************************************************
    // ***************** CONTROLES PARA COMPARACION INVENTARIO ****************
    //*************************************************************************
    
    @RequestMapping(value = "/comparacion", method = RequestMethod.GET)
    public ModelAndView downloadExcel(ModelMap model) {
    	  List<Book> listBooks = new ArrayList<Book>();
          listBooks.add(new Book("Effective Java", "Joshua Bloch", "0321356683",
                  "May 28, 2008", 38.11F));
          listBooks.add(new Book("Head First Java", "Kathy Sierra & Bert Bates",
                  "0596009208", "February 9, 2005", 30.80F));
          listBooks.add(new Book("Java Generics and Collections",
                  "Philip Wadler", "0596527756", "Oct 24, 2006", 29.52F));
          listBooks.add(new Book("Thinking in Java", "Bruce Eckel", "0596527756",
                  "February 20, 2006", 43.97F));
          listBooks.add(new Book("Spring in Action", "Craig Walls", "1935182358",
                  "June 29, 2011", 31.98F));
   
          // return a view which will be resolved by an excel view resolver
          
         // model.addAttribute("listBooks", listBooks);
          
         // return "Excell";
         // return new ModelAndView(home, "model", model);
          List<Producto> productos = productoService.findAllProductos();

          //incrementar retaceo
   
         model.addAttribute("producto", productos);
          //model.addAttribute("producto", "productos");
         
         
       /*  HashMap<Integer, List<String>> map = new HashMap<>(); 
         List<Producto> list = new ArrayList<Producto>();
        /* list.add("Java");
         list.add("Primefaces");
         list.add("JSF");*/
       //  map.put(1,listBooks);
          
          return new ModelAndView("Comparacion", "listBooks", listBooks);
    	
    }
    
   
    
    @RequestMapping(value = { "/edit-comparacion-{codigoproducto}-{ubicacion}-{cantidadfisico}" }, method = RequestMethod.GET)
    public String editComparacion(@PathVariable Integer codigoproducto,@PathVariable String ubicacion,@PathVariable Integer cantidadfisico, ModelMap model) {
    	
    	
    	//Ajuste ajuste = ajusteService.findById(codigoproducto);
    	Producto producto=productoService.findByCorrelativo(codigoproducto);    	
    	Integer cantidad=0;
    	
    	//System.out.println("sala---------------------------------" + ubicacion.compareTo("sala"));
    	String sala="sala";
    	
    	if(ubicacion.equals(sala)){
    		
    		System.out.println("sala---------------------------------" + ubicacion);
        	
        	
    	  cantidad=producto.getSala();
    		
    		//
    		
    	}
    	
    	else{
    		
    		  cantidad=producto.getExistencia();
    		//model.addAttribute("ubicacion","bodega");
    		
    	}
    	
    	model.addAttribute("ubicacion1",ubicacion);
    	model.addAttribute("cantidadfisico",cantidadfisico);
    	model.addAttribute("cantidad",cantidad);
    	model.addAttribute("producto",producto);
        model.addAttribute("edit", true);
        model.addAttribute("loggedinuser", getPrincipal());
        return "ajuste-reg";
    }
 
   @RequestMapping(value = { "/edit-comparacion-{codigoproducto}-{ubicacion}-{cantidadfisico}" }, method = RequestMethod.POST)
    public String updateComparacion(@Valid Producto producto, BindingResult result,
            ModelMap model, @PathVariable Integer codigoproducto,@PathVariable String ubicacion,@PathVariable Integer cantidadfisico,HttpServletRequest request) throws IOException {
 
	   
	   
	   
        
    	System.out.println("revisar:----------------------------------------------------------------------------" + cantidadfisico + ubicacion +codigoproducto);
     	
    	String concepto=request.getParameter("concepto");
    	
    	Integer cantidadinicial=0;
    	
    	
    	 cantidadinicial=cantidadinicial.parseInt(request.getParameter("existencia"));
    	 
    	 if(cantidadfisico>cantidadinicial){
    		 
    		 cantidadfisico=cantidadfisico-cantidadinicial;
    	 }
    	 
    	
    	Ajuste ajuste=new Ajuste();
    	
      Date fechaajuste=new Date();
    	
    	ajuste.setCantidad(cantidadfisico);
    	ajuste.setCantidadinicial(cantidadinicial);
    	ajuste.setCodigoproducto(codigoproducto);
    	ajuste.setConcepto(concepto);
    	ajuste.setDestino(ubicacion);
    	ajuste.setFechaajuste(fechaajuste);
    	
    	ajusteService.saveAjuste(ajuste);
    	
    	
    	Integer codigoajuste=ajuste.getCodigoajuste();
    	
      productoService.updateExistencia1(codigoproducto, cantidadfisico,ubicacion); 
      model.addAttribute("success", "Se ajusto la existencia del producto: <strong>"+codigoproducto+"  "+ producto.getNombreProducto()+"</strong> Se ha Actualizado ");
     
      HttpSession sesion=request.getSession(true);    	
      //Integer codigoCotizacion = (Integer) sesion.getAttribute("codigo6");          
      sesion.setAttribute("codigoultimo", codigoajuste);   
       
        //model.addAttribute("success", "Autor: <strong>" + autor.getNombreautor()+"</strong> Se ha Actualizado ");
        model.addAttribute("loggedinuser", getPrincipal());
        //return "ajuste-reg-succ";
        return "GenerarReporteAjuste";
       // return "redirect:/comparacion";
    }
    
    
    
  
    
    
    
    
    
    
    
    
    ///////////////////////NUEVAS ETIQUETAS/////////////////////
    
    
    @RequestMapping(value = { "/nuevas-etiquetas" }, method = RequestMethod.GET)
    public String newetiquetas( Busqueda busqueda,HttpServletRequest request,ModelMap model) {
      
    	Etiqueta etiqueta=new Etiqueta();
    	model.addAttribute("etiqueta", etiqueta);
    	
        model.addAttribute("edit", false);
        model.addAttribute("loggedinuser", getPrincipal());
    	
   	     
        List<Proveedor> proveedores = proveedorService.findAllProveedores();
        List<Producto> productos = productoService.findAllProductos();
        List<Etiqueta> etiquetas = etiquetaService.findAllEtiquetas();
        
        
        HttpSession sesion=request.getSession(true);    	
        //Integer codigoCotizacion = (Integer) sesion.getAttribute("codigo6");          
      //  sesion.setAttribute("codigoultimo", codigoCotizacion);         
        int marcado=0;
        
        for(int j=0;j<productos.size();j++){
        	
        	//Integer marcado=1;
        	if(productos.get(j).getMarcado()==1){
        		
        	   marcado=marcado+1;
        	}
        	
        	
        }
        
       // List<Autor> autor=autorService.findAllAutors();
        
        Editorial editorial = editorialService.findById(busqueda.getCodigoeditorial());
    	Area area = areaService.findById(busqueda.getCodigoarea());
    	Proveedor proveedor = proveedorService.findById(busqueda.getCodigoproveedor());
    	TipoProducto tipoproducto = tipoProductoService.findByCodTipoProducto(busqueda.getCodTipoProducto());
    	Autor autor = autorService.findById(busqueda.getCodigoautor());
    	Producto producto1=productoService.findByCodigoProducto(busqueda.getCodigoproducto());
        List<Producto> productos1=productoService.customSearchProducto(producto1, area, editorial, proveedor, tipoproducto, autor, busqueda);
        productos1.get(0).getCodigoProducto();
        
       
       // productos.get(0).get
       // System.out.println("revisar:----------------------------------------------------------------------------" + etiquetas.size());
    	
      
		model.addAttribute("marcado", marcado);
        model.addAttribute("proveedor", busqueda);
        model.addAttribute("proveedor", proveedores);
        model.addAttribute("producto", productos);// atributo para generar etiquetas
        model.addAttribute("etiquetas", etiquetas);///la lista a desplegar 
        model.addAttribute("autor", autor);
      
        return "GenerarEtiquetaReg";
  }
    
    @RequestMapping(value = { "/nuevas-etiquetas" }, method = RequestMethod.POST)   
    public String saveEtiqueta( HttpServletRequest request,@Valid Etiqueta etiqueta,
    		                  BindingResult result,
                              ModelMap model
                             ) 
    		throws IOException, ParseException {
         	/*
                String idPagoAsignado = request.getParameter("idPagoAsignado");
                String idReversoAsignado = request.getParameter("idReversoAsignado");    
    	  */
    	
    	
    	etiquetaService.saveEtiqueta(etiqueta);
         
    	if (result.hasErrors()) {
            return "detalleretaceo-reg";
        }
    	//detalleretaceoService.savedetalleRetaceo(detalleretaceo);
		
    	
    	model.addAttribute("loggedinuser", getPrincipal());

         return "redirect://nuevas-etiquetas";
      //  return "detalleretaceo-reg";
      
       // return "retaceo-reg-succ";
    }
    
    @RequestMapping(value = { "/cargar-etiquetas" }, method = RequestMethod.GET)
    public String cargartiquetas( Busqueda busqueda,HttpServletRequest request,ModelMap model) {
      
    	Etiqueta etiqueta=new Etiqueta();
    	
        List<Proveedor> proveedores = proveedorService.findAllProveedores();
        List<Producto> productos = productoService.findAllProductos();
        List<Etiqueta> etiquetas = etiquetaService.findAllEtiquetas();
          
        Editorial editorial = editorialService.findById(busqueda.getCodigoeditorial());
    	Area area = areaService.findById(busqueda.getCodigoarea());
    	Proveedor proveedor = proveedorService.findById(busqueda.getCodigoproveedor());
    	TipoProducto tipoproducto = tipoProductoService.findByCodTipoProducto(busqueda.getCodTipoProducto());
    	Autor autor = autorService.findById(busqueda.getCodigoautor());
    	Producto producto1=productoService.findByCodigoProducto(busqueda.getCodigoproducto());
        List<Producto> productos1=productoService.customSearchProducto(producto1, area, editorial, proveedor, tipoproducto, autor, busqueda);
        productos1.get(0).getCodigoProducto();       
               
        for(int i=0;i<productos.size();i++){
    	   
    	   
        	Etiqueta etiqueta1=new Etiqueta();
        	
        	if(productos.get(i).getMarcado()==1){
        	
    	String autor1=productos.get(i).getAutores().toString();
    	//.replace("[", " ");
    	autor1=autor1.replace("[", " ");
    	autor1=autor1.replace("]", " ");
    	etiqueta1.setCodigoproducto(productos.get(i).getCorrelativo());
    	etiqueta1.setNombreProducto(productos.get(i).getNombreProducto());
    	etiqueta1.setCantidad(productos.get(i).getCantidadetiquetar());
    	etiqueta1.setPrecioproducto(productos.get(i).getPrecio());
    	etiqueta1.setAutor_marca(autor1);
    	
    	etiquetaService.saveEtiqueta(etiqueta1);
    	
    	 System.out.println("autor:----------------------------------------------------------------------------"+productos.get(i).getNombreProducto());
        	
    	// etiqueta1.setAutor_marca() ;
       }
    	   
       }
        
       return "redirect:/nuevas-etiquetas";
       // return "GenerarTxt";
  }
    
    
    @RequestMapping(value = { "/delete-etiqueta-{codigoetiqueta}" }, method = RequestMethod.GET)
    public String deleteEtiqueta(@PathVariable Integer codigoetiqueta) {
  	  etiquetaService.deleteEtiquetaById(codigoetiqueta);     	    	
        return "redirect:/nuevas-etiquetas";
    }
    
    
    @RequestMapping(value = { "/delete-all-etiquetas-{vista}" }, method = RequestMethod.GET)
    public String deleteEtiquetaall(@PathVariable Integer vista) {
    	
    	
    	String redireccionar="";
    	 List<Etiqueta> etiquetas = etiquetaService.findAllEtiquetas();
    	 
    	 for(int i=0;i<etiquetas.size();i++){
    		 
    		 Integer codigoetiqueta=etiquetas.get(i).getCodigoetiqueta();
    		 
    		 etiquetaService.deleteEtiquetaById(codigoetiqueta);     		 
    		 
    	 }
    	 
    	 System.out.println("re:----------------------------------------------------------------------------" + vista);
     	
  	   	 if(vista==1){
  	   		 
  	   		redireccionar= "redirect:/index";
  	   	 } 
  	   	 
  	   	 else{
  	   		 
  	   	redireccionar= "redirect:/nuevas-etiquetas";
  	   		 
  	   	 }  	 
    	 
        return redireccionar;
    }
    
    
    @RequestMapping(value = { "/desmarcar-etiqueta" }, method = RequestMethod.GET)
    public String desmarcarEtiqueta() {
  	 // etiquetaService.deleteEtiquetaById(codigoetiqueta);    
    	List<Producto> productos = productoService.findAllProductos();
    	
    	for(int i=0;i<productos.size();i++){
    		
    		if(productos.get(i).getMarcado()==1){
    			
    			Integer codigoproducto=productos.get(i).getCorrelativo();
    			Integer cantidadetiquetar=0;
    			Integer marcado=0;
    			
    			productoService.updatedesmarcarProducto(codigoproducto, cantidadetiquetar, marcado);
    			System.out.println("re:----------------------------------------------------------------------------" + codigoproducto);
    	     	
    		}
    		
    	}
    	
    	
        return "redirect:/nuevas-etiquetas";
    }
    
  
    @RequestMapping(value = { "/finalizar-etiqueta" }, method = RequestMethod.GET)
    public String finetiquetas( HttpServletRequest request,ModelMap model)throws IOException, ParseException {
    	
	 	 List<Etiqueta> etiquetas = etiquetaService.findAllEtiquetas();
    	 model.addAttribute("success", "Las etiquetas <strong>"+"</strong> se generaron con exito ");
    	  model.addAttribute("etiquetas", etiquetas);///la lista a desplegar 
          
    	 // return new ModelAndView("GenerarEtiqueta-Reg");
    	return "GenerarEtiquetaSucc";////no tocar

    } 
    
  /*************************************************************************************
   ********************************Funciones auxiliares para las imagenes***************
   *************************************************************************************/
    
    public String byteToString(byte[] image) throws UnsupportedEncodingException{
    	
    	byte[] encoded = Base64.encodeBase64(image);
    	String encodedString = new String(encoded);
		 return encodedString;
	 }
    
    public byte[] readBytesFromFile(String filePath) throws IOException {
        File inputFile = new File(filePath);
       
        FileInputStream inputStream = new FileInputStream(inputFile);
         
        byte[] fileBytes = new byte[(int) inputFile.length()];
        inputStream.read(fileBytes);
        inputStream.close();
         
        return fileBytes;
    }
  
    /*************************************************************************************
     ************Controles para Gestion de la Base de Datos***************
     *************************************************************************************/
    //Control para la creacion del archivo de  Respaldo de la Base
    @RequestMapping(value={"/backup-crear"}, method = RequestMethod.GET)
  	public String Backup(ModelMap model){
  		model.addAttribute("loggedinuser", getPrincipal());
  		return "respaldoBase";
  	}
    
    //Control para realizar el cierre semestral
    @RequestMapping(value={"/cierre-semestral"}, method = RequestMethod.GET)
  	public String cierreSemestral(ModelMap model){
  		model.addAttribute("loggedinuser", getPrincipal());
  		return "cierreSemestral";
  	}
 
  //Control para la restuaracion de la Base
    @RequestMapping(value={"/restaurar-base"}, method = RequestMethod.GET)
  	public String RestaurarBackup(ModelMap model){
  		model.addAttribute("loggedinuser", getPrincipal());
  		return "restauracionBase";
  	}
    
}//Fin del Controlador