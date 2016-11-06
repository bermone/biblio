package fr.bermosa.web;
import fr.bermosa.domain.LivresAuteurs;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/livresauteurses")
@Controller
@RooWebScaffold(path = "livresauteurses", formBackingObject = LivresAuteurs.class)
public class LivresAuteursController {
}
