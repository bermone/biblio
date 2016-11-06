package fr.bermosa.web;
import fr.bermosa.domain.Edition;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/editions")
@Controller
@RooWebScaffold(path = "editions", formBackingObject = Edition.class)
public class EditionController {
}
