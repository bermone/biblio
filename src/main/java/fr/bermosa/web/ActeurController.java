package fr.bermosa.web;
import fr.bermosa.domain.Acteur;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/acteurs")
@Controller
@RooWebScaffold(path = "acteurs", formBackingObject = Acteur.class)
public class ActeurController {
}
