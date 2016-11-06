package fr.bermosa.web;
import fr.bermosa.domain.Livre;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/livres")
@Controller
@RooWebScaffold(path = "livres", formBackingObject = Livre.class)
public class LivreController {
}
