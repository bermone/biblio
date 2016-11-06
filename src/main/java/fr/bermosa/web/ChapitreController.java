package fr.bermosa.web;
import fr.bermosa.domain.Chapitre;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/chapitres")
@Controller
@RooWebScaffold(path = "chapitres", formBackingObject = Chapitre.class)
public class ChapitreController {
}
