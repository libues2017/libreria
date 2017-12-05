package fia.ues.sv.libues.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

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
import fia.ues.sv.libues.modelo.Factura;
import fia.ues.sv.libues.modelo.FacturaDetalle;
import fia.ues.sv.libues.modelo.Localizacion;
import fia.ues.sv.libues.modelo.Proveedor;
import fia.ues.sv.libues.modelo.Requisicion;
import fia.ues.sv.libues.modelo.Reservas;
import fia.ues.sv.libues.modelo.Retaceo;
import fia.ues.sv.libues.modelo.TipoProducto;
import fia.ues.sv.libues.modelo.Transferencia;
import fia.ues.sv.libues.modelo.Producto;
import fia.ues.sv.libues.modelo.User;
import fia.ues.sv.libues.modelo.Area;
import fia.ues.sv.libues.modelo.Busqueda;
import fia.ues.sv.libues.modelo.Cotizacion;
import fia.ues.sv.libues.modelo.DetalleCotizacion;
import fia.ues.sv.libues.modelo.DetalleRequisicion;
import fia.ues.sv.libues.modelo.UserProfile;
import fia.ues.sv.libues.service.LocalizacionService;
import fia.ues.sv.libues.service.AutorService;
import fia.ues.sv.libues.service.CotizacionService;
import fia.ues.sv.libues.service.DetalleCotizacionService;
import fia.ues.sv.libues.service.DetalleRequisicionService;
import fia.ues.sv.libues.service.DetalleRetaceoService;
import fia.ues.sv.libues.service.DetalleTransferenciaService;
import fia.ues.sv.libues.service.EditorialService;
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
	
	@Autowired
	LocalizacionService localizacionService;
		
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
	DetalleCotizacionService detallecotizacionService;
			
	@Autowired
	PersistentTokenBasedRememberMeServices persistentTokenBasedRememberMeServices;
	
	@Autowired
	AuthenticationTrustResolver authenticationTrustResolver;
	
	
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
    
    @ModelAttribute("localizaciones")
    public List<Localizacion> initializeLocalizacion() {
        return localizacionService.findAllLocalizaciones();
    }
    
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
    
    @ModelAttribute("cotizaciones")
    public List<Cotizacion> initializeCotizaciones(){
    	return cotizacionService.findAllCotizaciones();
    }
    
    @ModelAttribute("detallecotizaciones")
    public List<DetalleCotizacion> initializedetalleCotizaciones(){
    	return detallecotizacionService.findAllCotizaciones();
    }
    
    @ModelAttribute("reservas")
    public List<Reservas> initializeReservas(){
    	return reservasService.findAllReservas();
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
     * Se llamarï¿½ a este mï¿½todo en el envï¿½o del formulario, manejando la solicitud POST para
     * guardar usuario en la base de datos. Tambiï¿½n valida la entrada del usuario.
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
     * Se llamarï¿½ a este mï¿½todo en el envï¿½o del formulario, manejando la solicitud POST para
     * actualizar un usuario en la base de datos. Tambiï¿½n valida la entrada del usuario.
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
     *Este mï¿½todo maneja la redirecciï¿½n de acceso denegado.
     */
    @RequestMapping(value = "/Access_Denied", method = RequestMethod.GET)
    public String accessDeniedPage(ModelMap model) {
        model.addAttribute("loggedinuser", getPrincipal());
        return "accessdenied";
    }
 
    /**
     *Este mï¿½todo maneja las solicitudes GET de inicio de sesiï¿½n.
     * Si los usuarios ya iniciaron sesiï¿½n e intentan volver a la pï¿½gina de inicio de sesiï¿½n, se les redirigirï¿½ a la pï¿½gina de la lista.
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
     * Este mï¿½todo maneja las solicitudes de cierre de sesiï¿½n.
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
     * Este mï¿½todo devuelve el nombre de usuario que iniciï¿½ sesiï¿½n.
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
     * Este mï¿½todo devuelve verdadero si los usuarios ya estï¿½n autenticados [conectados], de lo contrario es falso.
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
        model.addAttribute("success", "Autor: <strong>" + autor.getNombreautor() + "</strong> Registrado");
        model.addAttribute("loggedinuser", getPrincipal());
        //return "success";
        return "autor-reg-succ";
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
        model.addAttribute("success", "Autor: <strong>" + autor.getNombreautor()+"</strong> Se ha Actualizado ");
        model.addAttribute("loggedinuser", getPrincipal());
        return "autor-reg-succ";
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
        model.addAttribute("success", "Proveedor: <strong>" + proveedor.getNombreproveedor()+"</strong> Se ha Actualizado ");
        model.addAttribute("loggedinuser", getPrincipal());
        return "proveedor-reg-succ";
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
    	byte[] file = readBytesFromFile("C:/mytemp/" + producto.getLocation());
    	System.out.println("C:/mytemp/"  +producto.getLocation());
    	producto.setImagen(file);
    	
    	byte[] filec = readBytesFromFile("C:/mytemp/" + producto.getLocationc());
    	System.out.println("C:/mytemp/" + producto.getLocationc());
    	producto.setImagenc(filec);
    	
    	productoService.saveProducto(producto);
    	//model.addAttribute("success", "Producto: <strong>" + producto.getNombreProducto()+"</strong> Registrado");
        model.addAttribute("loggedinuser", getPrincipal());
        //return "success";
        //return"producto-reg-succ";
        return "redirect:/producto-agregar";
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
        	byte[] file = readBytesFromFile("C:/mytemp/" + producto.getLocation());
        	System.out.println("C:/mytemp/" + producto.getLocation());
        	producto.setImagen(file);
        }
        
        if(producto.getLocationc()!=""){
        	byte[] filec = readBytesFromFile("C:/mytemp/" + producto.getLocationc());
        	System.out.println("C:/mytemp/" + producto.getLocationc());
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
    	
    	if(sesion.getAttribute("codigo")!=null)
    	{
    	  Integer codigo=(Integer) sesion.getAttribute("codigo");
    	  List<DetalleRetaceo> retaceoBuscar = detalleretaceoService.findRetaceos(codigo);  
    	 
    	  for (int i = 0; i < retaceoBuscar.size(); i++){
    		   total=total+retaceoBuscar.get(i).getSubtotal(); //aqui se calcula el total
    		  
    	  }    	  
    	 
    	  
    	  System.out.println("revisar:----------------------------------------------------------------------------" + retaceoBuscar.size());
    	  model.addAttribute("total", total);
    	  sesion2.setAttribute("total", total);// Se utilizara para almacenarlo en tabla retaceo
    	  model.addAttribute("retaceo2", retaceoBuscar);
       }
    	
    	 if(sesion.getAttribute("codigofacturaproveedor")!=null){
   		  sesion2.setAttribute("codigofacturaproveedor", sesion.getAttribute("codigofacturaproveedor"));
   		  sesion2.setAttribute("codigoproveedor", sesion.getAttribute("codigoproveedor"));
   		  sesion2.setAttribute("nombreproveedor", sesion.getAttribute("nombreproveedor"));
   	  }
   	  
   	  else{   	sesion2.setAttribute("codigofacturaproveedor", 0);  
		    	    sesion2.setAttribute("codigoproveedor", 0);
				    sesion2.setAttribute("nombreproveedor", " ");  	  
   	  
   	     }
   		     
    	
		     
        List<Proveedor> proveedores = proveedorService.findAllProveedores();
        List<Producto> productos = productoService.findAllProductos();
        
        //se obtiene el ultimo codigo retaceo       
        
		List<Retaceo> retaceo5 = retaceoService.findAllRetaceos();
		
		Integer codigo = retaceo5.get(retaceo5.size()-1).getCodigoretaceo();
        HttpSession sesion1=request.getSession(true);
        sesion1.setAttribute("codigo", codigo);    
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
        Double total=(Double)sesion.getAttribute("total");
        
        if(total==0.0){
        	
        	
        	 Integer codigo=(Integer) sesion.getAttribute("codigo");
       	  List<DetalleRetaceo> retaceoBuscar = detalleretaceoService.findRetaceos(codigo);  
       	 
       	  for (int i = 0; i < retaceoBuscar.size(); i++){
       		   total=total+retaceoBuscar.get(i).getSubtotal(); //aqui se calcula el total
       		  
       	  } 
        }
    	
        System.out.println("revisar:----------------------------------------------------------------------------"+total);
    	
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
			    	//sesion2.setAttribute("nombreproveedor", nombreproveedor);
			 		sesion.setAttribute("fecharetaceo", fecha);//se almacena la fecha para utilizarlo en finalizar retaceo
			 		sesion.setAttribute("fechafacturaproveedor", fechafac);//se almacena la fecha de factura para utilizarlo en finalizar retaceo		
			 		sesion.setAttribute("total", total);
			        
			        //System.out.println("codigodetalleretaceo:-----------------------------------------------------------" + codigodetalleretaceo);			        
			        return "detalleretaceo-modificar";
              
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
    	
    	detalleretaceoService.deleteRetaceoById(codigoretaceo);
    	return "redirect:/detalleretaceo-agregar";
        //return "redirect:/detalleretaceo-list";
    }
    
    @RequestMapping(value = { "/finalizar" }, method = RequestMethod.GET)
    public String findetalleRetaceo( HttpServletRequest request,ModelMap model)throws IOException, ParseException {
    	
		    	/*
				Aquï¿½ se detallan las siglas de las variables utilizadas en el cï¿½lculo: 
		
						Cantidad de Productos en existencia = PEX 
						Cantidad de Productos de entrada = PE 
						Costo Productos en Existencia = CPEX
						Costo Productos de entrada = CPE
						Costo Promedio Unitario = CPU
						Precio de Venta = PV 
						Total de Costo = TC
						Total de Artï¿½culos = TA  
						precio de venta anterior=PVA										
						La fï¿½rmula para el cï¿½lculo del costo promedio es la siguiente: 										 
						TC = (PEX*CPEX) +(PE*CPE) 
						TA = PEX+PE 
		                CPU=TC/TA 
						PV=CPU+(CPU*0.20). 									
				*/

          HttpSession sesion=request.getSession(true);
          Integer codigoretaceo=(Integer) sesion.getAttribute("codigo");
          sesion.setAttribute("codigoultimo", codigoretaceo);
          List<DetalleRetaceo> retaceoBuscar = detalleretaceoService.findRetaceos(codigoretaceo);
          for(int i=0;i<retaceoBuscar.size();i++){
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
        	  productoService.updateprecioProducto(codigoproducto, precio, costo,existencia);
        	 
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
                    
          Retaceo retaceo=new Retaceo();
          retaceo.setCodigoproveedor(codigoproveedor);
          retaceo.setCodigofacturaproveedor(codigofacturaproveedor);
          retaceo.setFecharetaceo(fecharetaceo1);
          retaceo.setFechafacturaproveedor(fechafacturaproveedor1);
          retaceo.setTotal(0.0);//inicializamos el total
          
          
  		retaceoService.saveRetaceo(retaceo);//aqui incrementa el retaceo
  		
        Integer codigo=0;
		sesion.setAttribute("codigo", codigo);
		
    	return "GenerarReporteRetaceoFiltrado";////no tocar

    } 
    
    
    
    @RequestMapping(value = { "/finalizar-update" }, method = RequestMethod.GET)
    public String findetalleRetaceoUpdate( HttpServletRequest request,ModelMap model)throws IOException, ParseException {
    	
		    	/*
				Aquï¿½ se detallan las siglas de las variables utilizadas en el cï¿½lculo: 
		
						Cantidad de Productos en existencia = PEX 
						Cantidad de Productos de entrada = PE 
						Costo Productos en Existencia = CPEX
						Costo Productos de entrada = CPE
						Costo Promedio Unitario = CPU
						Precio de Venta = PV 
						Total de Costo = TC
						Total de Artï¿½culos = TA  
						precio de venta anterior=PVA										
						La fï¿½rmula para el cï¿½lculo del costo promedio es la siguiente: 										 
						TC = (PEX*CPEX) +(PE*CPE) 
						TA = PEX+PE 
		                CPU=TC/TA 
						PV=CPU+(CPU*0.20). 						
														
				*/

          HttpSession sesion=request.getSession(true);
       //   Integer codigoretaceo=(Integer) sesion.getAttribute("codigo");
         // sesion.setAttribute("codigoultimo", codigoretaceo);
          
          Integer punto=(Integer) sesion.getAttribute("punto");
          Integer codigoretaceo=(Integer) sesion.getAttribute("codigo");
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
        	  productoService.updateprecioProducto(codigoproducto, precio, costo,existencia);
        	 
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
		        //   Integer codigoretaceo=(Integer) sesion.getAttribute("codigo");
		          // sesion.setAttribute("codigoultimo", codigoretaceo);		  	  
		  	  
  	      String fecha = request.getParameter("fecharetaceo");
  	   
          Integer punto=(Integer) sesion.getAttribute("punto");
          // Integer codigoretaceo=(Integer) sesion.getAttribute("codigo");
          // System.out.println("revisar--------------------------------------codigoproducto:"+ codigoproducto);	
           
           List<DetalleRetaceo> retaceoBuscar = detalleretaceoService.findRetaceos(codigodetalleretaceo);
           
           DetalleRetaceo detalle=detalleretaceoService.findById(codigodetalleretaceo);           
           
           System.out.println("revisar--------------------------------------tamaño:"+detalle.getCodigoproducto());	
            Producto productoBuscar = productoService.findByCorrelativo(codigoproducto);//encontramos el correlativo
           
            Integer existenciaanterior =detalle.getExistenciaanterior();  // 
       	  Double costoanterior =detalle.getCostounitarioanterior(); // 
       	  Integer cantidad =detalle.getCantidadproducto();//producto de entrada   
       	
       	  Integer existencia =productoBuscar.getExistencia()-cantidad;
       	  // restaremos para disminuir la cantidad en existencia se necesita actualizar la existencia
       	  
       	// System.out.println("revisar--------------------------------------codigoproducto:"+ codigoproducto+"    "+existencia);	

       	  Double utilidad=detalle.getUtilidad();
       	  utilidad=utilidad/100;
       	  Double precio=detalle.getPrecioproducto() ;
       	  Double costo=detalle.getCostoproducto();	///  costo  de producto entrada tabla retaceo   3
       	  costo=(existenciaanterior*costoanterior)+(costo*cantidad);	/// calcula y actualiza total costo   (12*2.4) + (3*2) 
       	  
       	  costo=costo/existencia;
       	  productoService.updateprecioProducto(codigoproducto, precio, costo,existencia);
       	  detalleretaceoService.deleteRetaceoById(codigodetalleretaceo);
           
	  	//detalleretaceoService.deleteRetaceoById(codigoretaceo);
	  //	return "redirect:/detalleretaceo-agregar";
           return "redirect:/edit-detalleRetaceo-"+detalle.getCodigoretaceo();
          // return "detalleretaceo-modificar";
           
     } 

    
    
    //////////////////Finaliza Proceso de  RETACEO
    
    
    
    
    
    
    
    /********************************************************************************************************************************
     *********************************** CONTROLES PARA TRANSFERENCIAS***************************************************************
     *******************************************************************************************************************************/
    @RequestMapping(value = { "/detalletransferencia-list" }, method = RequestMethod.GET)
    public String listTransferencias(ModelMap model) throws IOException {
        List<DetalleTransferencia> detalletransferencia = detalletransferenciaService.findAllTransferencias();
        model.addAttribute("detalletransferencia", detalletransferencia);
        model.addAttribute("loggedinuser", getPrincipal());
        return "detalletransferencia-list";
    }
    
    @RequestMapping(value = { "/transferencia-detalle-{codTransferencia}" }, method = RequestMethod.GET)
    public String listDetalleTransferencia(@PathVariable Integer codTransferencia, ModelMap model) throws IOException {
        DetalleTransferencia transferencia = detalletransferenciaService.findByCodigo(codTransferencia);
        model.addAttribute("transferencias", transferencia);
        model.addAttribute("loggedinuser", getPrincipal());
        return "transferencia-detalle";
    } 
    
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
        
        //HttpSession session = request.getSession();
    	HttpSession sesion2=request.getSession(true);
                
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
      
        if(sesion.getAttribute("numeroTransferencia")!=null){
        	sesion2.setAttribute("numeroTransferencia", sesion.getAttribute("numeroTransferencia"));
        }
        else{
        	sesion2.setAttribute("numeroTransferencia", 0);
        }
        
        List<Producto> productos = productoService.findAllProductos();

        //Incrementar Transferencia
       
        List<Transferencia> transferencia5 = transferenciaService.findAllTransferencias();
        Integer transferencia6 = transferencia5.get(transferencia5.size()-1).getCodTransferencia();
        HttpSession sesion1 = request.getSession(true);
        sesion1.setAttribute("codigo1", transferencia6);
        model.addAttribute("producto", productos);
        //numero de transferencia
        //Integer numeroTransferencia = transferenciaService.findById(transferencia6).getNumeroTransferencia();
        //sesion1.setAttribute("numeroTransferencia", numeroTransferencia);
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
        transferenciaService.updateFechaTransferencia(fechaTransferencia1, codTransferencia, numeroTransferencia1, tipoTransferencia, sucursal, estado);
        sesion2.setAttribute("numeroTransferencia", numeroTransferencia1);
        SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
        String fecha = sdf.format(fechaTransferencia1);
        sesion2.setAttribute("mySessionAttribute", fecha);
        model.addAttribute("loggedinuser", getPrincipal());

        return "redirect:/detalletransferencia-agregar";
      
    }
    
    @RequestMapping(value = { "/edit-detalleTransferencia-{codTransferencia}" }, method = RequestMethod.GET)
    public String editdetalleTransferencia(@PathVariable Integer codTransferencia, ModelMap model, HttpServletRequest request) throws IOException, ParseException{

        //detalleTransferenciaService
        //DetalleTransferencia detalleTransferencia = detalletransferenciaService.findById(codTransferencia);//detalleretaceoService.findById(codTransferencia);
        
        //model.addAttribute("detalletransferencia", detalleTransferencia);
        //model.addAttribute("edit", true);
        //model.addAttribute("loggedinuser", getPrincipal());
    	
    	DetalleTransferencia detalletransferencia = new DetalleTransferencia();
    	model.addAttribute("detalletransferencia", detalletransferencia);
    	model.addAttribute("edit", false);
    	model.addAttribute("loggedinuser", getPrincipal());
    	
    	HttpSession session1 = request.getSession(true);
    	
    	session1.setAttribute("codigo1", codTransferencia);
    	Double total = 0.0;
    	
    	List<DetalleTransferencia> transferenciaBuscar = detalletransferenciaService.findTransferencias(codTransferencia);
    	List<DetalleTransferencia> detalle = detalletransferenciaService.findTransferencias(codTransferencia);
    	Double utilidad = detalle.get(0).getUtilidad();
    	
    	for(int i = 0; i < transferenciaBuscar.size(); i++){
    		total = total + transferenciaBuscar.get(i).getSubTotal();
    	}
    	
    	model.addAttribute("total", total);
    	model.addAttribute("transferencia2", transferenciaBuscar);
    	
    	Transferencia transferencia = transferenciaService.findById(codTransferencia);
    	Date fechatransferencia = transferencia.getFechaTransferencia();
    	
    	List<Producto> productos = productoService.findAllProductos();
    	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    	String fecha = sdf.format(fechatransferencia);
    	model.addAttribute("fechatransferencia", fechatransferencia);
    	model.addAttribute("utilidad", utilidad);
    	model.addAttribute("edit", true);
    	model.addAttribute("producto", productos);
        
    	return "detalletransferencia-modificar";
    	//return "detalletransferencia-reg";
    }
    
    /*
   @RequestMapping(value = { "/edit-detalleTransferencia-{codTransferencia}" }, method = RequestMethod.POST)
    public String updateTransferencia(@Valid DetalleTransferencia detalleTransferencia, BindingResult result,
            ModelMap model, @PathVariable Integer codTransferencia) throws IOException, ParseException {
 
        if (result.hasErrors()) {
            return "detalletransferencia-reg";
        }
 
        detalletransferenciaService.updateTransferencia(detalleTransferencia);
        model.addAttribute("success", "transferencia: <strong>" + detalleTransferencia.getCodTransferencia()+"</strong> Se ha Actualizado ");
        model.addAttribute("loggedinuser", getPrincipal());
        return "detalletransferencia-reg-succ";
    }
    */
    @RequestMapping(value = { "/delete-detalleTransferencia-{codTransferencia}" }, method = RequestMethod.GET)
    public String deleteTransferencia(@PathVariable Integer codTransferencia) {
        detalletransferenciaService.deleteTransferenciaById(codTransferencia);
        return "redirect:/detalletransferencia-agregar";
    }
    
    @RequestMapping(value = { "/delete-transferencia-{codTransferencia}" }, method = RequestMethod.GET) // Eliminar una requisiciï¿½n de la tabla padre con sus hijas
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
                  productoService.updateExistencia1(codProducto, existencia);
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
        
          return "redirect:/transferencia-list";
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
    
    @RequestMapping(value={"/tralados"}, method = RequestMethod.GET)
	public String horashombre(ModelMap model){
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
    
     //*************************************************************************
     // ***************** CONTROLES PARA LOCALIZACION **************************
     //*************************************************************************
    @RequestMapping(value = { "/localizacion-list" }, method = RequestMethod.GET)
    public String listLocalizaciones(ModelMap model) throws IOException {
 
        List<Localizacion> localizaciones = localizacionService.findAllLocalizaciones();
                
        model.addAttribute("localizaciones", localizaciones);
        model.addAttribute("loggedinuser", getPrincipal());
        return "localizacion-list";
    }    
       
    
    @RequestMapping(value = { "/localizacion-agregar" }, method = RequestMethod.GET)
    public String newLocalizacion(ModelMap model) {
        
        Localizacion localizacion = new Localizacion();
        model.addAttribute("localizacion", localizacion);
        model.addAttribute("edit", false);
        model.addAttribute("loggedinuser", getPrincipal());
        return "localizacion-reg";
    }
    
    @RequestMapping(value = { "/localizacion-agregar" }, method = RequestMethod.POST)
    public String saveLocalizacion(@Valid Localizacion localizacion, BindingResult result,
            ModelMap model) throws IOException {
 
    	if (result.hasErrors()) {
            return "localizacion-reg";
        }
             	
    	localizacionService.saveLocalizacion(localizacion);
    	
        model.addAttribute("success", "Lugar: <strong>" + localizacion.getNombreprod()+"</strong> Registrado");
        model.addAttribute("loggedinuser", getPrincipal());
        //return "success";
        return "localizacion-reg-succ";
    }
    
    @RequestMapping(value = { "/edit-localizacion-{id}" }, method = RequestMethod.GET)
    public String editLocalizacion(@PathVariable Integer id, ModelMap model) {
    	
    	
    	Localizacion localizacion = localizacionService.findById(id);
    	
    	model.addAttribute("localizacion", localizacion);
        model.addAttribute("edit", true);
        model.addAttribute("loggedinuser", getPrincipal());
        return "localizacion-reg";
    }
 
    @RequestMapping(value = { "/edit-localizacion-{id}" }, method = RequestMethod.POST)
    public String updateLocalizacion(@Valid Localizacion localizacion, BindingResult result,
            ModelMap model, @PathVariable Integer id) throws IOException {
 
        if (result.hasErrors()) {
            return "localizacion-reg";
        }
 
        localizacionService.updateLocalizacion(localizacion);
            
 
        model.addAttribute("success", "Ubicacion de: <strong>" + localizacion.getNombreprod()+"</strong> Se ha Actualizado ");
        model.addAttribute("loggedinuser", getPrincipal());
        return "localizacion-reg-succ";
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
    public String listDetalleReq(@PathVariable Integer codigorequisicion, ModelMap model) throws IOException {
    	DetalleRequisicion req = detallerequisicionService.findByCodigo(codigorequisicion);
    	model.addAttribute("requisiciones", req);
    	model.addAttribute("loggedinuser", getPrincipal());
        return "requisicion-detalle";
    }   
    
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
    	
        List<Producto> productos = productoService.findAllProductos();       
		List<Requisicion> req5 = requisicionService.findAllRequisiciones();
		Integer req6 = req5.get(req5.size()-1).getCodigorequisicion();
        HttpSession sesion1=request.getSession(true);
        sesion1.setAttribute("codigo2", req6);        
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

    }// ******************************** Finaliza REQUISICIONES
    
       
    //*************************************************************************
    // ***************** CONTROLES PARA  FACTURACION **************************
    //*************************************************************************
    
    @RequestMapping(value = { "/factura-list" }, method = RequestMethod.GET)
    public String listFactura(ModelMap model) throws IOException {
    	List<Factura> facturas = facturaService.findAllFacturas();                
        model.addAttribute("facturas", facturas);
        model.addAttribute("loggedinuser", getPrincipal());
        return "factura-list";
    }
    
    @RequestMapping(value = { "/factura-detalle-{idfactura}" }, method = RequestMethod.GET)
    public String detalleFactura(@PathVariable Integer idfactura, ModelMap model) throws IOException {
    	Factura factura = facturaService.findById(idfactura);
    	model.addAttribute("factura", factura);
    	
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
    	facturaService.updateEstadoFacturaById(idfactura);
    	return "redirect:/factura-list";        
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
    	
    	String tipo = "CONTADO";    	 
   	 	    	
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
    
    @RequestMapping(value = { "/numero-factura" }, method = RequestMethod.GET)
    public String newNumeroFactura(ModelMap model) {
    	
    	Factura factura = new Factura();
        model.addAttribute("factura", factura);
        model.addAttribute("edit", false);
        model.addAttribute("loggedinuser", getPrincipal());
        
    	return "factura-set-numero"; 
    }
    
    @RequestMapping(value = { "/numero-factura" }, method = RequestMethod.POST)   
    public String saveNumeroFactura(@Valid Factura factura, BindingResult result, ModelMap model) throws IOException {
         	 	
    	if (result.hasErrors()) {
            return "factura-set-numero";
        } 	
       
    	facturaService.saveFactura(factura);
    	model.addAttribute("loggedinuser", getPrincipal());    	
    	return "redirect:/numero-factura";      
    }
    
    @RequestMapping(value = { "/facturacion-agregar" }, method = RequestMethod.GET)
    public String newFacturacion(ModelMap model) {
    	
    	Factura factura = new Factura();
        model.addAttribute("factura", factura);
        model.addAttribute("edit", false);
        model.addAttribute("loggedinuser", getPrincipal());        
    	return "facturacion"; 
    }
    
    @RequestMapping(value = { "/facturacion-agregar" }, method = RequestMethod.POST)   
    public String saveFacturacion(@Valid Factura factura, BindingResult result, ModelMap model) throws IOException {
         	 	
    	if (result.hasErrors()) {
            return "facturacion";
        }
    	facturaService.saveFactura(factura);
    	model.addAttribute("loggedinuser", getPrincipal());    	
    	return "redirect:/facturacion-agregar";      
    }
    
    @RequestMapping(value = { "/edit-facturacion-{idfactura}" }, method = RequestMethod.GET)
    public String editFacturacion(ModelMap model) {
    	
    	Factura factura = new Factura();
        model.addAttribute("factura", factura);
        model.addAttribute("edit", true);
        model.addAttribute("loggedinuser", getPrincipal());        
    	return "facturacion"; 
    }
    
    @RequestMapping(value = { "/edit-facturacion-{idfactura}" }, method = RequestMethod.POST)   
    public String updateFacturacion(@Valid Factura factura, BindingResult result, 
    		ModelMap model, @PathVariable Integer idfactura) throws IOException {         	 	
    	if (result.hasErrors()) {
            return "facturacion";
        }       
    	facturaService.updateFactura(factura);
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
        Reservas reservas = new Reservas();
        model.addAttribute("reservas", reservas);
        model.addAttribute("edit", false);
        model.addAttribute("loggedinuser", getPrincipal());       
        return "reservas-reg";
    }
    
    @RequestMapping(value = { "/reservas-agregar" }, method = RequestMethod.POST)
    public String saveReservacion(@Valid Reservas reservas, BindingResult result, ModelMap model) throws IOException { 
    	if (result.hasErrors()) {
            return "reservas-reg";
        }                 	  	
    	reservasService.saveReservas(reservas);
    	model.addAttribute("success", "Reservacion de: <strong>" + reservas.getNombreproducto() 
    						+ "</strong> Realizada a nombre de:" + reservas.getNombre());
        model.addAttribute("loggedinuser", getPrincipal());
        //return "success";
        return "reservas-reg-succ";
        //return "redirect:/area-agregar";
    }
    
    @RequestMapping(value = { "/edit-reservas-{codigoprod}" }, method = RequestMethod.GET)
    public String editReservas(@PathVariable Integer codigoprod, ModelMap model) throws IOException {
    	
    	Reservas reservas = new Reservas();
        model.addAttribute("reservas", reservas);
        model.addAttribute("edit", true);
        model.addAttribute("loggedinuser", getPrincipal());
        //model.addAttribute("area", getPrincipal());
        
      
        Integer codigo = productoService.findByCorrelativo(codigoprod).getCodigoProducto();
        model.addAttribute("codigo", codigo);
        
        return "reservas-reg"; 
    }
    
    @RequestMapping(value = { "/edit-reservas-{codigoprod}" }, method = RequestMethod.POST)   
    public String updateReservas(@Valid Reservas reservas, BindingResult result, 
    		ModelMap model, @PathVariable Integer codigoprod) throws IOException {
    	if (result.hasErrors()) {
            return "reservas-reg";
        }                 	  	
    	reservasService.saveReservas(reservas);
    	model.addAttribute("success", "Reservacion de: <strong>" + reservas.getNombreproducto() 
    						+ "</strong> Realizada a nombre de:" + reservas.getNombre());
        model.addAttribute("loggedinuser", getPrincipal());
        //return "success";
        return "reservas-reg-succ";
    }
    
  /*************************************************************************************************************************************************************
   ********************************************** Cotizaciones de Productos ************************************************************************************
   *************************************************************************************************************************************************************/
    @RequestMapping(value = { "/detallecotizacion-list" }, method = RequestMethod.GET)
    public String listCotizaciones(ModelMap model) throws IOException {
        List<DetalleCotizacion> detallecotizacion = detallecotizacionService.findAllCotizaciones();
        model.addAttribute("detallecotizacion", detallecotizacion);
        model.addAttribute("loggedinuser", getPrincipal());
        return "detallecotizacion-list";
    }
    
    @RequestMapping(value = { "/cotizacion-detalle-{codigoCotizacion}" }, method = RequestMethod.GET)
    public String listDetalleCotizacion(@PathVariable Integer codigoCotizacion, ModelMap model) throws IOException {
    	DetalleCotizacion cotizacion = detallecotizacionService.findByCodigo(codigoCotizacion);  	
    	model.addAttribute("cotizacion", cotizacion);
    	return "cotizacion-detalle";
    } 
    
    @RequestMapping(value = { "/cotizacion-list" }, method = RequestMethod.GET)
    public String listCotizacion(ModelMap model) throws IOException { 
        List<Cotizacion> cotizaciones = cotizacionService.findAllCotizaciones();                
        model.addAttribute("cotizaciones", cotizaciones);
        model.addAttribute("loggedinuser", getPrincipal());
        return "cotizaciones-list";
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
      		   total = total + cotizacionBuscar.get(i).getValorTotal();//.getValorUnitario();//getSubtotalfactura(); //aqui se calcula el total     		  
      	  	}
     		model.addAttribute("total", total); 
    		model.addAttribute("cotizacion2", cotizacionBuscar);
    	}
    	
    	List<Producto> productos = productoService.findAllProductos();       
		
    	//Incrementar Cotizacion
    	
    	List<Cotizacion> cotizacion5 = cotizacionService.findAllCotizaciones();//facturaService.findAllFacturas();
		Integer cotizacion6 = cotizacion5.get(cotizacion5.size()-1).getCodigoCotizacion();//.getNumeroCotizacion();//.getIdfactura();
        HttpSession sesion1 = request.getSession(true);
        sesion1.setAttribute("codigo6", cotizacion6);        
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
    
    
 
  //*************************************************************************
    // ***************** CONTROLES PARA COMPARACION INVENTARIO ****************
    //*************************************************************************
    
    @RequestMapping(value = "/downloadExcel", method = RequestMethod.GET)
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
          
          return new ModelAndView("Excell", "listBooks", listBooks);
    	
    }
    
    
    @RequestMapping(value = "/generarEtiquetas", method = RequestMethod.GET)
    public ModelAndView Etiquetas(ModelMap model) {
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
         model.addAttribute("loggedinuser", getPrincipal());    
          //model.addAttribute("producto", "productos");
         
         excell e=new excell();
         
         
         
       /*  HashMap<Integer, List<String>> map = new HashMap<>(); 
         List<Producto> list = new ArrayList<Producto>();
        /* list.add("Java");
         list.add("Primefaces");
         list.add("JSF");*/
       //  map.put(1,listBooks);
          
          return new ModelAndView("crearEtiquetas", "listBooks", listBooks);
    	
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
     ************Controles para el respaldo y recuperacion de Base de Datos***************
     *************************************************************************************/
    //Control para la creacion del archivo de  Respaldo de la Base
    @RequestMapping(value={"/backup-crear"}, method = RequestMethod.GET)
  	public String Backup(ModelMap model){
  		model.addAttribute("loggedinuser", getPrincipal());
  		return "respaldoBase";
  	}
      
   
    
    
}//Fin del Controlador