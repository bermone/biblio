// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package fr.bermosa.web;

import fr.bermosa.domain.Acteur;
import fr.bermosa.domain.Edition;
import fr.bermosa.domain.LivresEditions;
import fr.bermosa.web.EditionController;
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

privileged aspect EditionController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String EditionController.create(@Valid Edition edition, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, edition);
            return "editions/create";
        }
        uiModel.asMap().clear();
        edition.persist();
        return "redirect:/editions/" + encodeUrlPathSegment(edition.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String EditionController.createForm(Model uiModel) {
        populateEditForm(uiModel, new Edition());
        List<String[]> dependencies = new ArrayList<String[]>();
        if (Acteur.countActeurs() == 0) {
            dependencies.add(new String[] { "creerPar", "acteurs" });
        }
        uiModel.addAttribute("dependencies", dependencies);
        return "editions/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String EditionController.show(@PathVariable("id") Long id, Model uiModel) {
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("edition", Edition.findEdition(id));
        uiModel.addAttribute("itemId", id);
        return "editions/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String EditionController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("editions", Edition.findEditionEntries(firstResult, sizeNo, sortFieldName, sortOrder));
            float nrOfPages = (float) Edition.countEditions() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("editions", Edition.findAllEditions(sortFieldName, sortOrder));
        }
        addDateTimeFormatPatterns(uiModel);
        return "editions/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String EditionController.update(@Valid Edition edition, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, edition);
            return "editions/update";
        }
        uiModel.asMap().clear();
        edition.merge();
        return "redirect:/editions/" + encodeUrlPathSegment(edition.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String EditionController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, Edition.findEdition(id));
        return "editions/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String EditionController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        Edition edition = Edition.findEdition(id);
        edition.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/editions";
    }
    
    void EditionController.addDateTimeFormatPatterns(Model uiModel) {
        uiModel.addAttribute("edition_dtfinusage_date_format", DateTimeFormat.patternForStyle("S-", LocaleContextHolder.getLocale()));
        uiModel.addAttribute("edition_dtcreation_date_format", DateTimeFormat.patternForStyle("S-", LocaleContextHolder.getLocale()));
        uiModel.addAttribute("edition_dtmodification_date_format", DateTimeFormat.patternForStyle("S-", LocaleContextHolder.getLocale()));
    }
    
    void EditionController.populateEditForm(Model uiModel, Edition edition) {
        uiModel.addAttribute("edition", edition);
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("acteurs", Acteur.findAllActeurs());
        uiModel.addAttribute("livreseditionses", LivresEditions.findAllLivresEditionses());
    }
    
    String EditionController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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
