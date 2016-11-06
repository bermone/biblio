// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package fr.bermosa.web;

import fr.bermosa.domain.Edition;
import fr.bermosa.domain.Livre;
import fr.bermosa.domain.LivresEditions;
import fr.bermosa.web.LivresEditionsController;
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

privileged aspect LivresEditionsController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String LivresEditionsController.create(@Valid LivresEditions livresEditions, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, livresEditions);
            return "livreseditionses/create";
        }
        uiModel.asMap().clear();
        livresEditions.persist();
        return "redirect:/livreseditionses/" + encodeUrlPathSegment(livresEditions.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String LivresEditionsController.createForm(Model uiModel) {
        populateEditForm(uiModel, new LivresEditions());
        List<String[]> dependencies = new ArrayList<String[]>();
        if (Edition.countEditions() == 0) {
            dependencies.add(new String[] { "edition", "editions" });
        }
        if (Livre.countLivres() == 0) {
            dependencies.add(new String[] { "livre", "livres" });
        }
        uiModel.addAttribute("dependencies", dependencies);
        return "livreseditionses/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String LivresEditionsController.show(@PathVariable("id") Long id, Model uiModel) {
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("livreseditions", LivresEditions.findLivresEditions(id));
        uiModel.addAttribute("itemId", id);
        return "livreseditionses/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String LivresEditionsController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("livreseditionses", LivresEditions.findLivresEditionsEntries(firstResult, sizeNo, sortFieldName, sortOrder));
            float nrOfPages = (float) LivresEditions.countLivresEditionses() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("livreseditionses", LivresEditions.findAllLivresEditionses(sortFieldName, sortOrder));
        }
        addDateTimeFormatPatterns(uiModel);
        return "livreseditionses/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String LivresEditionsController.update(@Valid LivresEditions livresEditions, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, livresEditions);
            return "livreseditionses/update";
        }
        uiModel.asMap().clear();
        livresEditions.merge();
        return "redirect:/livreseditionses/" + encodeUrlPathSegment(livresEditions.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String LivresEditionsController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, LivresEditions.findLivresEditions(id));
        return "livreseditionses/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String LivresEditionsController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        LivresEditions livresEditions = LivresEditions.findLivresEditions(id);
        livresEditions.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/livreseditionses";
    }
    
    void LivresEditionsController.addDateTimeFormatPatterns(Model uiModel) {
        uiModel.addAttribute("livresEditions_dtfinusage_date_format", DateTimeFormat.patternForStyle("S-", LocaleContextHolder.getLocale()));
        uiModel.addAttribute("livresEditions_dtcreation_date_format", DateTimeFormat.patternForStyle("S-", LocaleContextHolder.getLocale()));
    }
    
    void LivresEditionsController.populateEditForm(Model uiModel, LivresEditions livresEditions) {
        uiModel.addAttribute("livresEditions", livresEditions);
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("editions", Edition.findAllEditions());
        uiModel.addAttribute("livres", Livre.findAllLivres());
    }
    
    String LivresEditionsController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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
