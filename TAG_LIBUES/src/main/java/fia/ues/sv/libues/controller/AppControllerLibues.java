package fia.ues.sv.libues.controller;

import java.text.ParseException;

/* Import Leer Archivos
import java.io.File;
import java.io.FileInputStream;
import org.apache.commons.codec.binary.Base64;
import java.io.UnsupportedEncodingException;*/

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.beans.PropertyEditorSupport;

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
import fia.ues.sv.libues.modelo.Localizacion;
import fia.ues.sv.libues.modelo.Proveedor;
import fia.ues.sv.libues.modelo.Requisicion;
import fia.ues.sv.libues.modelo.Retaceo;
import fia.ues.sv.libues.modelo.TipoProducto;
import fia.ues.sv.libues.modelo.Transferencia;
import fia.ues.sv.libues.modelo.Producto;
import fia.ues.sv.libues.modelo.User;
import fia.ues.sv.libues.modelo.Area;
import fia.ues.sv.libues.modelo.Busqueda;
import fia.ues.sv.libues.modelo.DetalleRequisicion;
import fia.ues.sv.libues.modelo.UserProfile;
import fia.ues.sv.libues.service.LocalizacionService;
import fia.ues.sv.libues.service.AutorService;
import fia.ues.sv.libues.service.DetalleRequisicionService;
import fia.ues.sv.libues.service.DetalleRetaceoService;
import fia.ues.sv.libues.service.DetalleTransferenciaService;
import fia.ues.sv.libues.service.EditorialService;
import fia.ues.sv.libues.service.ProveedorService;
import fia.ues.sv.libues.service.RequisicionService;
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
	RetaceoService retaceoService;
	
	@Autowired
	TransferenciaService transferenciaService;
			
	@Autowired
	DetalleRetaceoService detalleretaceoService;
	
	@Autowired
	DetalleTransferenciaService detalletransferenciaService;
			
	@Autowired
	PersistentTokenBasedRememberMeServices persistentTokenBasedRememberMeServices;
	
	@Autowired
	AuthenticationTrustResolver authenticationTrustResolver;
	
	
	/**
     * This method will list all existing users.
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
     * This method will be called on form submission, handling POST request for
     * saving user in database. It also validates the user input
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
 
        model.addAttribute("success", "Usuario " + user.getFirstName() + " "+ user.getLastName() + " Registrado Correctamente");
        model.addAttribute("loggedinuser", getPrincipal());
        //return "success";
        return "registrationsuccess";
    }
 
    /**@ModelAttribute("novedades")
    public List<Libro> listaNovedades(){
        return libroService.findNovedades();
    }**/

 
    /**
     * This method will provide the medium to update an existing user.
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
     * This method will be called on form submission, handling POST request for
     * updating user in database. It also validates the user input
     */
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
 
        model.addAttribute("success", "Usuario " + user.getFirstName() + " "+ user.getLastName() + " Actualizado Correctamente");
        model.addAttribute("loggedinuser", getPrincipal());
        return "registrationsuccess";
    }
 
     
    /**
     * This method will delete an user by it's SSOID value.
     */
    @RequestMapping(value = { "/delete-user-{ssoId}" }, method = RequestMethod.GET)
    public String deleteUser(@PathVariable String ssoId) {
        userService.deleteUserBySSO(ssoId);
        return "redirect:/list";
    }
     
 
    /**
     * This method will provide UserProfile list to views
     */
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
    
   /* @ModelAttribute("retaceos")
    public List<Retaceo> initializeRetaceos() {
        return retaceoService.findAllRetaceos();
    }*/
     
    /**
     * This method handles Access-Denied redirect.
     */
    @RequestMapping(value = "/Access_Denied", method = RequestMethod.GET)
    public String accessDeniedPage(ModelMap model) {
        model.addAttribute("loggedinuser", getPrincipal());
        return "accessdenied";
    }
 
    /**
     * This method handles login GET requests.
     * If users is already logged-in and tries to goto login page again, will be redirected to list page.
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
     * This method handles logout requests.
     * Toggle the handlers if you are RememberMe functionality is useless in your app.
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
     * This method returns the principal[user-name] of logged-in user.
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
     * This method returns true if users is already authenticated [logged-in], else false.
     */
    private boolean isCurrentAuthenticationAnonymous() {
        final Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        return authenticationTrustResolver.isAnonymous(authentication);
    }
    
    /**
     *CONTROLES PARA LA TABLA AREA
     */
    @RequestMapping(value = { "/area-list" }, method = RequestMethod.GET)
    public String listAreas(ModelMap model) throws IOException {
 
        List<Area> area = areaService.findAllAreas();
                
        model.addAttribute("area", area);
        model.addAttribute("loggedinuser", getPrincipal());
        return "area-list";
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
    public String saveArea(@Valid Area area, BindingResult result,
            ModelMap model) throws IOException {
 
    	if (result.hasErrors()) {
            return "area-reg";
        }
                 	  	
    	areaService.saveArea(area);
    	
 
        model.addAttribute("success", "Area: <strong>" + area.getNombrearea() + "</strong> Registrado");
        model.addAttribute("loggedinuser", getPrincipal());
        //return "success";
        return "area-reg-succ";
    }
    
        
    @RequestMapping(value = { "/edit-area-{codigoarea}" }, method = RequestMethod.GET)
    public String editArea(@PathVariable Integer codigoarea, ModelMap model) {
    	
    	
    	//areaService
    	Area area = areaService.findById(codigoarea);
    	model.addAttribute("area", area);
        model.addAttribute("edit", true);
        model.addAttribute("loggedinuser", getPrincipal());
        return "area-reg";
    }
 
    @RequestMapping(value = { "/edit-area-{codigoarea}" }, method = RequestMethod.POST)
    public String updateArea(@Valid Area area, BindingResult result,
            ModelMap model, @PathVariable Integer codigoarea) throws IOException {
 
        if (result.hasErrors()) {
            return "area-reg";
        }
 
        areaService.updateArea(area);

        
 
        model.addAttribute("success", "Area: <strong>" + area.getNombrearea()+"</strong> Se ha Actualizado ");
        model.addAttribute("loggedinuser", getPrincipal());
        return "area-reg-succ";
    }
    
    @RequestMapping(value = { "/delete-area-{codigoarea}" }, method = RequestMethod.GET)
    public String deleteArea(@PathVariable Integer codigoarea) {
    	
    	areaService.deleteAreaById(codigoarea);
        return "redirect:/area-list";
    }
    
    
    /**
     *CONTROLES PARA LA TABLA AUTORES
     */
    
    
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
    	
    	
    	//areaService
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
    
    
    /**
     * CONTROL PARA LA TABLA EDITORIALES
     */
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
    	
    	
 
        model.addAttribute("success", "Editorial: <strong>" + editorial.getNombre()+"</strong> Registrado");
        model.addAttribute("loggedinuser", getPrincipal());
        //return "success";
        return "editorial-reg-succ";
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
            
 
        model.addAttribute("success", "Editorial: <strong>" + editorial.getNombre()+"</strong> Se ha Actualizado ");
        model.addAttribute("loggedinuser", getPrincipal());
        return "editorial-reg-succ";
    }
    
    @RequestMapping(value = { "/delete-editorial-{codigoeditorial}" }, method = RequestMethod.GET)
    public String deleteEditorial(@PathVariable Integer codigoeditorial) {
    	
    	editorialService.deleteEditorial(codigoeditorial);
    	
        return "redirect:/editorial-list";
    }
    
    /**
     *CONTROLES PARA LA TABLA DE PROVEEDORES
     */
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
    
    
    
    /**
     *CONTROLES PARA LA TABLA TIPO PRODUCTOS
     */
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
    
    /**
     * CONTROLES PARA LA TABLA PRODUCTO
     */
    
    @RequestMapping(value = { "/producto-detalle-{codigoProducto}" }, method = RequestMethod.GET)
    public String detProductos(@PathVariable Integer codigoProducto, ModelMap model) throws IOException {
    	Producto producto = productoService.findByCodigoProducto(codigoProducto);
    	model.addAttribute("producto", producto);
    	
        return "producto-detalle";
    }   
    
    @RequestMapping(value = { "/producto-list" }, method = RequestMethod.GET)
    public String listProductos(ModelMap model) throws IOException {
 
               
        List<Producto> productos = productoService.findAllProductos();
                
        model.addAttribute("producto", productos);
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
    	//System.out.println(producto.getArea());
    	//System.out.println(producto.getProveedor());
    	//System.out.println(producto.getTipoProducto());
    	//System.out.println(producto.getCodigoautor());
    	
    	productoService.saveProducto(producto);
    	
        model.addAttribute("success", "Producto: <strong>" + producto.getNombreProducto()+"</strong> Registrado");
        model.addAttribute("loggedinuser", getPrincipal());
        //return "success";
        return "producto-reg-succ";
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
        
        productoService.updateProducto(producto);
                 
 
        model.addAttribute("success", "Producto: <strong>" + producto.getNombreProducto()+"</strong> Se ha Actualizado ");
        model.addAttribute("loggedinuser", getPrincipal());
        return "producto-reg-succ";
    }
    
    @RequestMapping(value = { "/delete-producto-{codigoProducto}" }, method = RequestMethod.GET)
    public String deleteProducto(@PathVariable Integer codigoProducto) {
    	
    	
    	productoService.deleteByCodigoProducto(codigoProducto);
    	    	
        return "redirect:/producto-list";
    }
    
  /*  @InitBinder
    public void initBinderDate(WebDataBinder binder) {
        CustomDateEditor editor = new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd"), true);
        binder.registerCustomEditor(Date.class, editor);
    }*/
    
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
    

    /* INVENTARIO*/
    
    @RequestMapping(value = { "/comparar-inventario" }, method = RequestMethod.GET)
    public String main2(ModelMap model) {       
        model.addAttribute("loggedinuser", getPrincipal());
        return "comparar-inventario";
    }
    

    /**
     *CONTROLES PARA LA TABLA DetalleRetaceo
     */
    
    
    @RequestMapping(value = { "/detalleretaceo-list" }, method = RequestMethod.GET)
    public String listRetaceos(ModelMap model) throws IOException {
         List<DetalleRetaceo> detalleretaceo = detalleretaceoService.findAllRetaceos();
        model.addAttribute("detalleretaceo", detalleretaceo);
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
    	 /* String data =request.getParameter("fechafacturaproveedor");
    	  Date fecha=null;
    	  
    	  
    	  if(sesion2.getAttribute("mySessionAttribute")==null){
    		  data=request.getParameter("fechafacturaproveedor");
    		  sesion2.setAttribute("mySessionAttribute", data);
    		  
    	  }
    	  /*
    	  else
    	  {
        	  SimpleDateFormat d = new SimpleDateFormat("dd/MM/yyyy");
        	  try {
    		       fecha = d.parse("02/03/2016");
    		       data="02/02/2016";
    		      // d.format(fecha);
    			//model.addAttribute("fecha", data);
    			  sesion2.setAttribute("mySessionAttribute", data);
    		} catch (ParseException e) {
    			// TODO Auto-generated catch block
    			e.printStackTrace();
    		}
    		  
    	  }
    	
    	  */
    	  //Date fecha = new Date();
    	  Producto producto=new Producto();
    	
    	if(sesion.getAttribute("codigo")!=null)
    	{
    	  Integer codigo=(Integer) sesion.getAttribute("codigo");
    	  List<DetalleRetaceo> retaceoBuscar = detalleretaceoService.findRetaceos(codigo);
    	  model.addAttribute("retaceo2", retaceoBuscar);
       }

   /* if(sesion2.getAttribute("mySessionAttribute")==null)
    	{
           sesion2.setAttribute("mySessionAttribute", fecha);
       }
      	else{
    		String fecharetaceo = request.getParameter("fecharetaceo");
        //HttpSession sesion2=request.getSession(true);
       		sesion2.setAttribute("mySessionAttribute", fecharetaceo);	
    	}
    	*/
    	  
        List<Proveedor> proveedores = proveedorService.findAllProveedores();
        List<Producto> productos = productoService.findAllProductos();

        //incrementar retaceo
       
		List<Retaceo> retaceo5 = retaceoService.findAllRetaceos();
		Integer retaceo6 = retaceo5.get(retaceo5.size()-1).getCodigoretaceo();
        HttpSession sesion1=request.getSession(true);
        sesion1.setAttribute("codigo", retaceo6);
        Integer codigo=(Integer)sesion1.getAttribute("codigo");
        model.addAttribute("success",codigo);
        model.addAttribute("proveedor", proveedores);
        model.addAttribute("producto", productos);
        model.addAttribute("message", "hello");
        return "detalleretaceo-reg";
  }
    
    @RequestMapping(value = { "/detalleretaceo-agregar" }, method = RequestMethod.POST)   
    public String saveRetaceo( HttpServletRequest request,@Valid DetalleRetaceo detalleretaceo, BindingResult result, ModelMap model,@RequestParam(required = false) String fecharetaceo ) throws IOException, ParseException {
         	/*
                String idPagoAsignado = request.getParameter("idPagoAsignado");
                String idReversoAsignado = request.getParameter("idReversoAsignado");    
    	  */
 
          //HttpSession sesion1=request.getSession(true);
  	
    	if (result.hasErrors()) {
            return "detalleretaceo-reg";
        }
    	detalleretaceoService.savedetalleRetaceo(detalleretaceo);
		
    	Integer codigoretaceo = Integer.parseInt(request.getParameter("codigoretaceo"));
    	HttpSession sesion2=request.getSession(true);
    	Date fecharetaceo1 = new SimpleDateFormat("yyyy-MM-dd").parse(fecharetaceo);
    	retaceoService.updateFechaRetaceo(fecharetaceo1, codigoretaceo);
    	SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
    	String fecha = sdf.format(fecharetaceo1);
 		 sesion2.setAttribute("mySessionAttribute", fecha);
    	model.addAttribute("loggedinuser", getPrincipal());

         return "redirect:/detalleretaceo-agregar";
      //  return "detalleretaceo-reg";
      
       // return "retaceo-reg-succ";
    }
    
        
    @RequestMapping(value = { "/edit-detalleRetaceo-{codigoretaceo}" }, method = RequestMethod.GET)
    public String editdetalleRetaceo(@PathVariable Integer codigoretaceo, ModelMap model) {

    	//areaService
    	DetalleRetaceo detalleRetaceo = detalleretaceoService.findById(codigoretaceo);
    	
    	model.addAttribute("detalleretaceo", detalleRetaceo);
        model.addAttribute("edit", true);
        model.addAttribute("loggedinuser", getPrincipal());
        return "detalleretaceo-reg";
    }
 
    @RequestMapping(value = { "/edit-detalleRetaceo-{codigoretaceo}" }, method = RequestMethod.POST)
    public String updateRetaceo(@Valid DetalleRetaceo detalleRetaceo, BindingResult result,
            ModelMap model, @PathVariable Integer codigoretaceo) throws IOException {
 
        if (result.hasErrors()) {
            return "detalleretaceo-reg";
        }
 
        detalleretaceoService.updateRetaceo(detalleRetaceo);
        model.addAttribute("success", "retaceo: <strong>" + detalleRetaceo.getCodigoretaceo()+"</strong> Se ha Actualizado ");
        model.addAttribute("loggedinuser", getPrincipal());
        return "detalleretaceo-reg-succ";
    }
    
    @RequestMapping(value = { "/delete-detalleRetaceo-{codigoretaceo}" }, method = RequestMethod.GET)
    public String deleteRetaceo(@PathVariable Integer codigoretaceo) {
    	
    	detalleretaceoService.deleteRetaceoById(codigoretaceo);
    	return "redirect:/detalleretaceo-agregar";
        //return "redirect:/detalleretaceo-list";
    }
    
    @RequestMapping(value = { "/finalizar" }, method = RequestMethod.GET)
    public String findetalleRetaceo( HttpServletRequest request,ModelMap model,@RequestParam(required = false) String fecharetaceo )throws IOException, ParseException {
    	
          HttpSession sesion=request.getSession(true);
    	
          Integer codigoretaceo=(Integer) sesion.getAttribute("codigo");
          
          sesion.setAttribute("codigoultimo", codigoretaceo);
          
          List<DetalleRetaceo> retaceoBuscar = detalleretaceoService.findRetaceos(codigoretaceo);
          for(int i=0;i<retaceoBuscar.size();i++){
        	  Integer codigoproducto =retaceoBuscar.get(i).getCodigoproducto();
        	  Integer existenciaanterior =retaceoBuscar.get(i).getExistenciaanterior();
        	  Integer cantidad =retaceoBuscar.get(i).getCantidadproducto();
        	  Integer existencia =existenciaanterior+cantidad;
        	  
        	Double precio=retaceoBuscar.get(i).getPrecioproducto() ;
        	 Double costo=retaceoBuscar.get(i).getCostoproducto();	 
        	 productoService.updateprecioProducto(codigoproducto, precio, costo,existencia);
        	 
          }
          
          //Integer retaceo6 = retaceo5.get(retaceo5.size()-1).getCodigoretaceo();
         // retaceoBuscar.get(arg0);
         // sesion.setAttribute("mySessionAttribute", fecha)
          
          
          String fecha=(String) sesion.getAttribute("mySessionAttribute");
          
          Date fecharetaceo1 = new SimpleDateFormat("yyyy-MM-dd").parse(fecha);
          
          Retaceo retaceo=new Retaceo();
          retaceo.setFecharetaceo(fecharetaceo1);
          
  		retaceoService.saveRetaceo(retaceo);
  		
        Integer codigo=0;
		sesion.setAttribute("codigo", codigo);
    	
    	return "GenerarReporteRetaceo";

    } //////////////////Finaliza Proceso de  RETACEO
    
    /********************************************************************************************************************************
     *********************************** CONTROLES PARA LA TABLA Detalle Transferencia **********************************************
     *******************************************************************************************************************************/
    @RequestMapping(value = { "/detalletransferencia-list" }, method = RequestMethod.GET)
    public String listTransferencias(ModelMap model) throws IOException {
        List<DetalleTransferencia> detalletransferencia = detalletransferenciaService.findAllTransferencias();
        model.addAttribute("detalletransferencia", detalletransferencia);
        model.addAttribute("loggedinuser", getPrincipal());
        return "detalletransferencia-list";
    }
    
  
    @RequestMapping(value = { "/detalletransferencia-agregar" }, method = RequestMethod.GET)
    public String newdetalleTransferencia( HttpServletRequest request,ModelMap model) {
        DetalleTransferencia detalletransferencia = new DetalleTransferencia();
        model.addAttribute("detalletransferencia", detalletransferencia);
        model.addAttribute("edit", false);
        model.addAttribute("loggedinuser", getPrincipal());
    	HttpSession sesion = request.getSession(true);
    	 	 
    	//HttpSession session = request.getSession();
    	
    	//Producto producto = new Producto();
    	
    	if(sesion.getAttribute("codigo1") != null)
    	{
    	  Integer codigo1 = (Integer) sesion.getAttribute("codigo1");
    	  List<DetalleTransferencia> transferenciaBuscar = detalletransferenciaService.findTransferencias(codigo1);
    	  model.addAttribute("transferencia2", transferenciaBuscar);
       }
  	  
        List<Producto> productos = productoService.findAllProductos();

        //Incrementar Transferencia
       
		List<Transferencia> transferencia5 = transferenciaService.findAllTransferencias();
		Integer transferencia6 = transferencia5.get(transferencia5.size()-1).getCodTransferencia();
        HttpSession sesion1 = request.getSession(true);
        sesion1.setAttribute("codigo1", transferencia6);
        //Integer codigo1 = (Integer)sesion1.getAttribute("codigo1");
        //model.addAttribute("success",codigo1);
        model.addAttribute("producto", productos);
        //model.addAttribute("message", "hello");
        return "detalletransferencia-reg";
  }
    
    @RequestMapping(value = { "/detalletransferencia-agregar" }, method = RequestMethod.POST)   
    public String saveTransferencia( HttpServletRequest request,@Valid DetalleTransferencia detalletransferencia, 
    		BindingResult result, ModelMap model,@RequestParam(required = false) String fechaTransferencia, String tipoTransferencia, String origen, String destino ) throws IOException, ParseException {
         	
  	
    	if (result.hasErrors()) {
            return "detalletransferencia-reg";
        }
    	detalletransferenciaService.savedetalleTransferencia(detalletransferencia);
		
    	Integer codTransferencia = Integer.parseInt(request.getParameter("codTransferencia"));
    	HttpSession sesion2 = request.getSession(true);
    	Date fechaTransferencia1 = new SimpleDateFormat("yyyy-MM-dd").parse(fechaTransferencia);
    	transferenciaService.updateFechaTransferencia(fechaTransferencia1, codTransferencia, tipoTransferencia, origen, destino);
    	SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
    	String fecha = sdf.format(fechaTransferencia1);
 		sesion2.setAttribute("mySessionAttribute", fecha);
    	model.addAttribute("loggedinuser", getPrincipal());

        return "redirect:/detalletransferencia-agregar";
      
    }
    
    @RequestMapping(value = { "/edit-detalleTransferencia-{codTransferencia}" }, method = RequestMethod.GET)
    public String editdetalleTransferencia(@PathVariable Integer codTransferencia, ModelMap model) {

    	//detalleTransferenciaService
    	DetalleTransferencia detalleTransferencia = detalletransferenciaService.findById(codTransferencia);//detalleretaceoService.findById(codTransferencia);
    	
    	model.addAttribute("detalletransferencia", detalleTransferencia);
        model.addAttribute("edit", true);
        model.addAttribute("loggedinuser", getPrincipal());
        return "detalletransferencia-reg";
    }
    
    @RequestMapping(value = { "/edit-detalleTransferencia-{codTransferencia}" }, method = RequestMethod.POST)
    public String updateTransferencia(@Valid DetalleTransferencia detalleTransferencia, BindingResult result,
            ModelMap model, @PathVariable Integer codTransferencia) throws IOException {
 
        if (result.hasErrors()) {
            return "detalletransferencia-reg";
        }
 
        detalletransferenciaService.updateTransferencia(detalleTransferencia);
        model.addAttribute("success", "transferencia: <strong>" + detalleTransferencia.getCodTransferencia()+"</strong> Se ha Actualizado ");
        model.addAttribute("loggedinuser", getPrincipal());
        return "detalletransferencia-reg-succ";
    }
    
    @RequestMapping(value = { "/delete-detalleTransferencia-{codTransferencia}" }, method = RequestMethod.GET)
    public String deleteTransferencia(@PathVariable Integer codTransferencia) {
    	
    	detalletransferenciaService.deleteTransferenciaById(codTransferencia);
    	return "redirect:/detalletransferencia-agregar";
    }
    
    @RequestMapping(value = { "/finalizar1" }, method = RequestMethod.GET)
    public String findetalleTransferencia( HttpServletRequest request,ModelMap model,
    	@RequestParam(required = false) String fechaTransferencia, String tipoTransferencia )throws IOException, ParseException {
    	
          HttpSession sesion = request.getSession(true);
          Integer codTransferencia = (Integer) sesion.getAttribute("codigo1");
          sesion.setAttribute("codigoultimo", codTransferencia);
          
          List<DetalleTransferencia> transferenciaBuscar = detalletransferenciaService.findTransferencias(codTransferencia);
          for(int i=0;i<transferenciaBuscar.size();i++){
        	  Integer codProducto = transferenciaBuscar.get(i).getCodProducto();
        	  Integer existenciaAnterior = transferenciaBuscar.get(i).getExistenciaAnterior();
        	  Integer cantidad = transferenciaBuscar.get(i).getCantidadProducto();
        	  
        	  Double precio = transferenciaBuscar.get(i).getPrecioProducto();
    		  Double costo = transferenciaBuscar.get(i).getCostoProducto();	
        	  
        	  if (tipoTransferencia == "Ingresos"){
        		  Integer existencia = existenciaAnterior + cantidad;        		   
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
          transferencia.setFechaTransferencia(fechaTransferencia1);
          
  		  transferenciaService.saveTransferencia(transferencia);
          
          Integer codigo1 = 0;
		  sesion.setAttribute("codigo1", codigo1);
    	
    	  return "detalletransferencia-list";
    }
    
 /**************************************************************************************************************************************
  *********************************************************** Fin Transferencias ******************************************************* 
  **************************************************************************************************************************************/
    
    //Controles para el Reporte de Retace de Producto
    @RequestMapping(value={"/vol_ent"}, method = RequestMethod.GET)
	public String volumenEntrante(ModelMap model){
		model.addAttribute("loggedinuser", getPrincipal());
		return "volmov_e";
	}
    
       
    @RequestMapping(value={"/tralados"}, method = RequestMethod.GET)
	public String horashombre(ModelMap model){
		model.addAttribute("loggedinuser", getPrincipal());
		return "ReportTRASL";
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
  		return "existencias";
  	}
      
           
      @RequestMapping(value={"/repo_existencias"}, method = RequestMethod.GET)
  	public String repoexistencias(ModelMap model){
  		model.addAttribute("loggedinuser", getPrincipal());
  		return "ReportEXISTENCIAS";
  	}

    
    /**
     * CONTROL PARA LA TABLA LOCALIZACIONES
     */
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
    

    //METODOS PARA LAS BUSQUEDAS
    @RequestMapping(value = { "/producto-busqueda" }, method = RequestMethod.GET)
    public String busquedaProducto(ModelMap model ) throws IOException {
 
        Busqueda busqueda = new Busqueda();  
        
    	model.addAttribute("busqueda",busqueda);
        model.addAttribute("loggedinuser", getPrincipal());
        return "producto-busqueda";
    }
    
   // List<Libro> libros_busqueda = new ArrayList<Libro>();
    
    @RequestMapping(value = { "/producto-busqueda" }, method = RequestMethod.POST)
    public String enviarParametros(Busqueda busqueda, ModelMap model) throws IOException {
    
    	Editorial editorial = editorialService.findById(busqueda.getCodigoeditorial());
    	Area area = areaService.findById(busqueda.getCodigoarea());
    	Proveedor proveedor = proveedorService.findById(busqueda.getCodigoproveedor());
    	TipoProducto tipoproducto = tipoProductoService.findByCodTipoProducto(busqueda.getCodTipoProducto());
    	Autor autor = autorService.findById(busqueda.getCodigoautor());
    	
    	List<Producto> productos = productoService.customSearch(area, editorial, proveedor, tipoproducto, autor, busqueda);
    	/*for(Libro libro: libros){
        	libro.setImg(byteToString(libro.getImagen()));
        }*/
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
    // ***************** REQUISICIONES ****************************************
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
    	
    	if(sesion.getAttribute("codigo2")!=null)
    	{
    		Integer codigo2=(Integer) sesion.getAttribute("codigo2");
    		List<DetalleRequisicion> requisicionBuscar = detallerequisicionService.findRequisiciones(codigo2);
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
    		ModelMap model,@RequestParam(required = false) String destino, String fecharequisicion ) throws IOException, ParseException {
         	 	
    	if (result.hasErrors()) {
            return "detallerequisicion-reg";
        }
    	detallerequisicionService.saveDetalleRequisicion(detallerequisicion);
		
    	Integer codigorequisicion = Integer.parseInt(request.getParameter("codigorequisicion"));
    	HttpSession sesion2=request.getSession(true);
    	Date fecharequisicion1 = new SimpleDateFormat("yyyy-MM-dd").parse(fecharequisicion);    	
    	requisicionService.updateFechaRequisicion(fecharequisicion1, destino, codigorequisicion);
    	SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
    	String fecha = sdf.format(fecharequisicion1);
 		sesion2.setAttribute("mySessionAttribute", fecha);
    	model.addAttribute("loggedinuser", getPrincipal());
    return "redirect:/detallerequisicion-agregar";      
    }
    
    @RequestMapping(value = { "/delete-detallerequisicion-{codigorequisicion}" }, method = RequestMethod.GET)
    public String deleteRequisicion(@PathVariable Integer codigorequisicion) {    	
    	detallerequisicionService.deleteRequisicionById(codigorequisicion);
    	return "redirect:/detallerequisicion-agregar";        
    }
    
    @RequestMapping(value = { "/guardar" }, method = RequestMethod.GET)
    public String saveDetalleRequisicion( HttpServletRequest request,ModelMap model,@RequestParam(required = false) 
    	   String fecharequisicion, String destino )throws IOException, ParseException {
    	
          HttpSession sesion=request.getSession(true);    	
          Integer codigorequisicion = (Integer) sesion.getAttribute("codigo2");          
          sesion.setAttribute("codigoultimo", codigorequisicion);     
                   
      //    String destino = request.getParameter("destinorequisicion");
          
          List<DetalleRequisicion> requisicionBuscar = detallerequisicionService.findRequisiciones(codigorequisicion);
          for(int i=0;i<requisicionBuscar.size();i++){
        	  
        	  Integer codigoproducto = requisicionBuscar.get(i).getCodigoproducto();
        	  Integer bodega1 = requisicionBuscar.get(i).getBodega();        	  
        	  Integer sala1 = requisicionBuscar.get(i).getSala();
        	  Integer cantidad = requisicionBuscar.get(i).getCantidad();
        	  
        	  if (destino == "BODEGA"){
	        	  Integer existencia = bodega1 + cantidad;
	        	  Integer sala = sala1 - cantidad;
	        	  productoService.updateExistencia(codigoproducto, existencia, sala);
        	  }
        	  else {
        		  Integer existencia = bodega1 - cantidad;
            	  Integer sala = sala1 + cantidad;
            	  productoService.updateExistencia(codigoproducto, existencia, sala);
        	  }
        	  System.out.println(destino+ " Hola");
          }          
       
          String fecha =(String) sesion.getAttribute("mySessionAttribute");          
          Date fecharequisicion1 = new SimpleDateFormat("yyyy-MM-dd").parse(fecha);          
          Requisicion requisicion = new Requisicion();
          requisicion.setFecha(fecharequisicion1);          
  		  requisicionService.saveRequisicion(requisicion);  		
          Integer codigo2 = 0;
		  sesion.setAttribute("codigo2", codigo2);
    	
		return "detallerequisicion-list";

    }
    
    // ******************************** Finaliza REQUISICIONES
    
    // ------------------- FACTURACION ------
    
    @RequestMapping(value = { "/detallefacturacion-agregar" }, method = RequestMethod.GET)
    public String newDetalleFacturacion( HttpServletRequest request,ModelMap model) {
    	
    	
    	
    	return "detallefacturacion-agregar"; 
    }
    
    // -----------------------------------------------------------------
    // *****************************************************************
    
    
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
    
    
   

    
}//Fin del Controlador