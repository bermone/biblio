// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package fr.bermosa.web;

import fr.bermosa.domain.Acteur;
import fr.bermosa.domain.Role;
import fr.bermosa.web.RoleController;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.joda.time.format.DateTimeFormat;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect RoleController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String RoleController.create(@Valid Role role, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, role);
            return "roles/create";
        }
        uiModel.asMap().clear();
        role.persist();
        return "redirect:/roles/" + encodeUrlPathSegment(role.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String RoleController.createForm(Model uiModel) {
        populateEditForm(uiModel, new Role());
        List<String[]> dependencies = new ArrayList<String[]>();
        if (Acteur.countActeurs() == 0) {
            dependencies.add(new String[] { "acteur", "acteurs" });
        }
        uiModel.addAttribute("dependencies", dependencies);
        return "roles/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String RoleController.show(@PathVariable("id") Long id, Model uiModel) {
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("role", Role.findRole(id));
        uiModel.addAttribute("itemId", id);
        return "roles/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String RoleController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("roles", Role.findRoleEntries(firstResult, sizeNo, sortFieldName, sortOrder));
            float nrOfPages = (float) Role.countRoles() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("roles", Role.findAllRoles(sortFieldName, sortOrder));
        }
        addDateTimeFormatPatterns(uiModel);
        return "roles/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String RoleController.update(@Valid Role role, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, role);
            return "roles/update";
        }
        uiModel.asMap().clear();
        role.merge();
        return "redirect:/roles/" + encodeUrlPathSegment(role.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String RoleController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, Role.findRole(id));
        return "roles/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String RoleController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        Role role = Role.findRole(id);
        role.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/roles";
    }
    
    void RoleController.addDateTimeFormatPatterns(Model uiModel) {
        uiModel.addAttribute("role_dtcreation_date_format", DateTimeFormat.patternForStyle("S-", LocaleContextHolder.getLocale()));
    }
    
    void RoleController.populateEditForm(Model uiModel, Role role) {
        uiModel.addAttribute("role", role);
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("acteurs", Acteur.findAllActeurs());
    }
    
    String RoleController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
        String enc = httpServletRequest.getCharacterEncoding();
        if (enc == null) {
            enc = WebUtils.DEFAULT_CHARACTER_ENCODING;
        }
        try {
            pathSegment = UriUtils.encodePathSegment(pathSegment, enc);
        } catch (UnsupportedEncodingException uee) {}
        return pathSegment;
    }
    
}
