// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package fr.bermosa.web;

import fr.bermosa.domain.Groupe;
import fr.bermosa.domain.Livre;
import fr.bermosa.domain.LivresGroupes;
import fr.bermosa.web.LivresGroupesController;
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

privileged aspect LivresGroupesController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String LivresGroupesController.create(@Valid LivresGroupes livresGroupes, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, livresGroupes);
            return "livresgroupeses/create";
        }
        uiModel.asMap().clear();
        livresGroupes.persist();
        return "redirect:/livresgroupeses/" + encodeUrlPathSegment(livresGroupes.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String LivresGroupesController.createForm(Model uiModel) {
        populateEditForm(uiModel, new LivresGroupes());
        List<String[]> dependencies = new ArrayList<String[]>();
        if (Groupe.countGroupes() == 0) {
            dependencies.add(new String[] { "groupe", "groupes" });
        }
        if (Livre.countLivres() == 0) {
            dependencies.add(new String[] { "livre", "livres" });
        }
        uiModel.addAttribute("dependencies", dependencies);
        return "livresgroupeses/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String LivresGroupesController.show(@PathVariable("id") Long id, Model uiModel) {
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("livresgroupes", LivresGroupes.findLivresGroupes(id));
        uiModel.addAttribute("itemId", id);
        return "livresgroupeses/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String LivresGroupesController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("livresgroupeses", LivresGroupes.findLivresGroupesEntries(firstResult, sizeNo, sortFieldName, sortOrder));
            float nrOfPages = (float) LivresGroupes.countLivresGroupeses() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("livresgroupeses", LivresGroupes.findAllLivresGroupeses(sortFieldName, sortOrder));
        }
        addDateTimeFormatPatterns(uiModel);
        return "livresgroupeses/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String LivresGroupesController.update(@Valid LivresGroupes livresGroupes, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, livresGroupes);
            return "livresgroupeses/update";
        }
        uiModel.asMap().clear();
        livresGroupes.merge();
        return "redirect:/livresgroupeses/" + encodeUrlPathSegment(livresGroupes.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String LivresGroupesController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, LivresGroupes.findLivresGroupes(id));
        return "livresgroupeses/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String LivresGroupesController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        LivresGroupes livresGroupes = LivresGroupes.findLivresGroupes(id);
        livresGroupes.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/livresgroupeses";
    }
    
    void LivresGroupesController.addDateTimeFormatPatterns(Model uiModel) {
        uiModel.addAttribute("livresGroupes_dtfinusage_date_format", DateTimeFormat.patternForStyle("S-", LocaleContextHolder.getLocale()));
        uiModel.addAttribute("livresGroupes_dtcreation_date_format", DateTimeFormat.patternForStyle("S-", LocaleContextHolder.getLocale()));
    }
    
    void LivresGroupesController.populateEditForm(Model uiModel, LivresGroupes livresGroupes) {
        uiModel.addAttribute("livresGroupes", livresGroupes);
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("groupes", Groupe.findAllGroupes());
        uiModel.addAttribute("livres", Livre.findAllLivres());
    }
    
    String LivresGroupesController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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
